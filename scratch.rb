require 'json'
require 'simple_oauth'
require 'excon'
require_relative 'lib/twitter_creds'


class Twitter
  attr_accessible :headers, \
                  :api_key, :api_secret, \
                  :token, :token_secret, \
                  :screen_name, :text, :query

  def initialize
    :api_key = API_KEY
    :api_secret = API_SECRET
    :token = ACCESS_TOKEN
    :token_secret = ACCESS_TOKEN_SECRET
  end

  

end



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
