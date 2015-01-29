require 'json'
require 'simple_oauth'
require 'excon'
require_relative 'lib/twitter_creds'

### GOALS

# See any users timeline -- ./twitter timeline zspencer
# See any users information (Join date, location, etc.) -- ./twitter info jfarmer
# See any users followers -- ./twitter followers <yourhandle>
# See who is following any user -- ./twitter following <yourhandle>
# Send a tweet -- ./twitter tweet I know kung fu
# Send a DM -- ./twitter message zspencer do you know kung fu?
# Follow a user -- ./twitter follow jfarmer
# Unfollow a user -- ./twitter unfollow zspencer

### METHODS

# Contains high-level variables and methods for a Twitter command-line client
class Twitter
  attr_accessor :headers, \
                :api_key, :api_secret, \
                :token, :token_secret, \
                :screen_name, :text, :query

  def initialize
    @api_key = API_KEY
    @api_secret = API_SECRET
    @token = ACCESS_TOKEN
    @token_secret = ACCESS_TOKEN_SECRET
  end

  def timeline(screen_name)
    api_key
  end

end

### TESTS

twitter = Twitter.new
p twitter.timeline 'goldenson'

# authorization_header = SimpleOAuth::Header.new("post",
# "https://api.twitter.com/1.1/direct_messages/new.json",
# { :screen_name => "goldenson",
#   :text => "I can send myself DMs in Ruby!" },
#   { :consumer_key => API_KEY,
#     :consumer_secret => API_SECRET,
#     :token => ACCESS_TOKEN,
#     :token_secret => ACCESS_TOKEN_SECRET })
#
#     response = Excon.send("post", "https://api.twitter.com/1.1/direct_messages/new.json", {
#       :query => { :screen_name => "goldenson",
#         :text => "I can send myself DMs in Ruby!" },
#         :headers => { "Authorization" => authorization_header.to_s }
#         })
#
#         puts response.body
#         puts response.status
