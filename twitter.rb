#!/usr/bin/env ruby
# This lets us to run this from the command line as ./twitter instead of `ruby
# twitter`

require 'json'
require 'simple_oauth'
require 'excon'
require_relative 'lib/twitter_creds'
require_relative 'lib/twitter'
require 'pp'

if API_KEY.nil? || API_SECRET.nil?
  puts 'Make sure you configure your Twitter application first. See README.md.'
  puts 'Your Twitter API key and API secret need to go in .env'
end

API_URL = 'https://api.twitter.com/1.1/'

### COMMANDS

# See any users timeline -- ./twitter timeline zspencer
# See any users information -- ./twitter info jfarmer
# See any users followers -- ./twitter followers <yourhandle>
# See who is following any user -- ./twitter following <yourhandle>
# Send a tweet -- ./twitter tweet I know kung fu
# Send a DM -- ./twitter message zspencer do you know kung fu?
# Follow a user -- ./twitter follow jfarmer
# Unfollow a user -- ./twitter unfollow zspencer

# Implements a Twitter command-line client
module TwitterClient
    class Twitter
    def run_app(command, arguments, next_cursor_str = '-1')
      ui = TwitterUI.new

      case command
      when 'timeline'
        # Passing only first argument makes command more error-tolerant
        results = timeline(arguments[0])
      when 'info'
        results = info(arguments[0])
      when 'followers'
        results = follow_command("followers", arguments[0], next_cursor_str, ui)
      when 'following'
        results = follow_command("following", arguments[0], next_cursor_str, ui)
      when 'tweet'
        tweet = arguments.join(' ')
        results = tweet(tweet)
      when 'message'
        recipient = arguments.shift
        message = arguments.join(' ')
        results = dm(recipient, message)
      when 'follow'
        results = follow(arguments[0])
      when 'unfollow'
        results = unfollow(arguments[0])
      else
        puts "#{command} not yet a supported command."
      end

      ui.print_results(results, command)
      results
    end

    def timeline(screen_name)
      tweets = []
      uri = API_URL + 'statuses/user_timeline.json'

      options = { screen_name: screen_name }
      tweets_json = send_request_and_get_json('get', uri, options)
      tweets_json.each do |tweet_json|
        tweet = tweet_json["text"]
        tweets << tweet
      end

      tweets
    end

    def info(screen_name)
      uri = API_URL + 'users/show.json'

      options = { screen_name: screen_name }
      info_json = send_request_and_get_json('get', uri, options)

      results = {}
      results['name'] = info_json['name']
      results['joined'] = info_json['created_at']
      results['location'] = info_json['location']
      results['description'] = info_json['description']

      results
    end

    def followers(screen_name, next_cursor_str)
      uri = API_URL + 'followers/list.json'

      followers_or_following_request(uri, screen_name, next_cursor_str)
    end

    def following(screen_name, next_cursor_str)
      uri = API_URL + 'friends/list.json'

      followers_or_following_request(uri, screen_name, next_cursor_str)
    end

    def followers_or_following_request(uri, screen_name, next_cursor_str)
      options = { screen_name: screen_name, cursor: next_cursor_str }
      follow_json = send_request_and_get_json('get', uri, options)

      users_json = follow_json['users']
      screen_names = values_from_json(users_json, 'screen_name')
      next_cursor_str = follow_json['next_cursor_str']

      { results: screen_names, next_cursor_str: next_cursor_str }
    end

    def tweet(tweet)
      uri = API_URL + 'statuses/update.json'
      options = { status: tweet }

      tweet_json = send_request_and_get_json('post', uri, options)
      posted_tweet = tweet_json['text']

      posted_tweet
    end

    def dm(screen_name, message)
      uri = API_URL + 'direct_messages/new.json'
      options = { screen_name: screen_name, text: message }

      dm_json = send_request_and_get_json('post', uri, options)
      sent_dm = dm_json['text']

      sent_dm
    end

    def follow(screen_name)
      uri = API_URL + 'friendships/create.json'
      options = { screen_name: screen_name }

      follow_json = send_request_and_get_json('post', uri, options)
      follow_json['following']
    end

    def unfollow(screen_name)
      uri = API_URL + 'friendships/destroy.json'
      options = { screen_name: screen_name }

      unfollow_json = send_request_and_get_json('post', uri, options)
      unfollow_json['following'] == false ? true : false
    end

    def send_request_and_get_json(request_type, uri, options)
      auth_header = auth_header(request_type, uri, options)
      response = query(request_type, uri, auth_header, options)
      json = JSON.parse(response.body)
      no_errors?(json)

      json
    end

    def auth_header(request, uri, options)
      SimpleOAuth::Header.new(request,
                              uri,
                              options,
                              consumer_key: API_KEY,
                              consumer_secret: API_SECRET,
                              token: ACCESS_TOKEN,
                              token_secret: ACCESS_TOKEN_SECRET)
    end

    def query(request, uri, auth_header, options)
      params = { query: options,
                 headers: { Authorization: auth_header.to_s }
               }

      Excon.send(request, uri, params)
    end

    def values_from_json(json, key)
      values = []
      json.map { |hash| values << hash[key] }
      values
    end

    def no_errors?(json)
      if json.is_a?(Hash) && errors = json[:errors]
        puts 'Twitter API reports errors!'
        errors.each do |error|
          puts error[:message]
        end
        false
      end
      true
    end

    def follow_command(command, screen_name, next_cursor_str, ui)
      results = []
      loop do
        case command
        when 'following'
          one_result_set = following(screen_name, next_cursor_str)
        when 'followers'
          one_result_set = followers(screen_name, next_cursor_str)
        else
          fail ArgumentError, "I don't know the command #{command}."
        end

        results << one_result_set[:results]
        ui.print_results(results, command)
        return results unless ui.want_more_results?
        next_cursor_str = one_result_set[:next_cursor_str]
      end
      results
    end
  end
end

# Gets and displays Twitter information to user
# FUTURE: flesh out by command
class TwitterUI
  def print_results(results, command)
    PP.pp results
  end

  def want_more_results?
    print 'Do you want 20 more results? (y/n): '
    answer = $stdin.gets.chomp # Using $stdin, else normal gets takes ARGV args
    case answer
    when 'y'
      return true
    when 'n'
      return false
    else
      puts "Yo, I don't understand. Please enter 'y' or 'n'."
      want_more_results?
    end
  end
end


### MAIN

command = ARGV.shift
arguments = ARGV
twitter = TwitterClient::Twitter.new
twitter.run_app(command, arguments)

### TESTS

# twitter = Twitter.new
# tweets = twitter.run_app('timeline','goldenson')
# puts tweets.include?("See if you can explain this. :) http://t.co/GskFzjQsip")
