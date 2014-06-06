# Working with Twitter

Twitter is an amazing service for connecting people all over the world to talk
about the latest celebrity gossip.

As the [README](../README.md) suggests, you'll be building a command line
application to interact with twitter. Twitters [web
API](glossary.md#web-service-or-web-api)


Because Twitter makes money selling access to their API; every
[request](glossary.md#request) must be [authenticated at the application
level](glossary.md#authentication_contexts). This means you'll need to register
your application with twitter so you can get your api key and secret.

### Registering Your Application

1. Go to [dev.twitter.com](https://dev.twitter.com/) and sign in with your twitter account
2. Click your twitter avatar in the top right corner and then select "my applications"
3. Click "Create New App"
4. Fill in the Application details section.
  * P.s. Both the `Website` and `Callback URL` fields need a public website address;
    but it doesn't have to be yours. I put http://www.google.com/.
5. Accept the "Rules of the Road"
6. Click "Create Your Application"
7. Click "API Keys"
8. Fill in your API Key and API Secret at `lib/twitter_creds.rb`

At this point, your application can access twitter and read public information!
Hooray! Now your app can keep up on
[@justinbeiber](https://twitter.com/JustinBieber)!

Let's check out what the Beib has to say, shall we?

### Getting a Users Timeline from the Command Line

Before we go all cahrazy and start programming some ruby, we'll want to try it
from the terminal.

To do this, we'll be using the
[statuses/user\_timeline
API](https://dev.twitter.com/docs/api/1.1/get/statuses/user_timeline).
This page tells us everything about how to get a twitter users timeline from their API. Let's break it down!

* Resource URL - This is the location on the Internet we'll be requesting
  statuses from.
* Parameters - This is a bunch of optional (or required) data the service could
  use.  The only one we need is `screen_name`.
* Example Request - An example of both the URL to use to make the request, and the data returned by it.

Now, let's grab that data!

1. Go back to [apps.twitter.com](https://apps.twitter.com)
1. Select your application
1. Click on the `Test Oauth` button.
1. Note the `Consumer key` and `Consumer secret` fields already
   have your Applications API Token and API Secret.
1. Fill in `Request URI` with `https://api.twitter.com/1.1/statuses/user_timeline.json`
1. Fill in `Request query` with `screen_name=justinbeiber`
1. Click `See OAuth Signature for this request`

*Phew*! All this work just to get some Beiber tweets! There are two interesting parts of this page:

1. The `Authorization header` - This [HTTP Header](glossary.md#http-headers)
   identifies your application to the Twitter service. This is the literal text
   that is transmitted as part of an [http request](glossary.md#request).
2. The `cURL command` - This is a command you can copy and paste into your
   terminal to see Justin Beibers tweets!

Go ahead! Copy and paste the contents of the `cURL command` into your terminal
and run it!

What's all that text that flies by!? It's tweets
[encoded](glossary.md#encoding-and-decoding) as
[JSON](glossary.md#json-javascropt-object-notation)!

Since JSON is somewhat hard to read, let's use Ruby to parse this down!

### Getting Tweets in Ruby

First, make sure you've put your api key and api secret in
`lib/twitter_creds.rb`.

Good? Great! Now, create a file called `scratch.rb` in this projects root
directory, paste the contents into it, and run it!

```
require 'json'
require 'simple_oauth'
require 'excon'
require_relative 'lib/twitter_creds'

authorization_header = SimpleOAuth::Header.new("get",
                                               "https://api.twitter.com/1.1/statuses/user_timeline.json",
                                               { :screen_name => "justinbeiber" },
                                               { :consumer_key => API_KEY,
                                                 :consumer_secret => API_SECRET })

response = Excon.send("get", "https://api.twitter.com/1.1/statuses/user_timeline.json", {
  :query => { :screen_name => "justinbeiber" },
  :headers => { "Authorization" => authorization_header.to_s }
})

beibs_tweets = JSON.parse(response.body)
puts beibs_tweets.first
```

Well, wouldya look at that?! It's a ruby hash of Justin Beibers latest tweet!
Now, tweets have quite a bit of [Metadata](glossary.md#metadata); so let's
investigate!

```
beibs_tweets.first.keys
# See anything interesting? How bout "text"?
beibs_tweets.first["text"]
```

Congratulations! You've interacted with twitters API! Now pour yourself your
beverage of choice, since we've still got a ways to go if we want to be able to
publish DMs and tweets as ourselves.

### Posting a Tweet
