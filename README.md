# Twitter Client

Welcome to the second week of your wonderful adventure of discovery! This
week you'll write a command line program to interact with Twitter. In the
process, you'll learn:

1. The difference between data and information
1. How data is transmitted on the web
1. How to use a web api that requires a application context for authentication
1. How to use a web api that requires a user context authentication

## Your Mission

Your mission is to build a command line ruby program that allows a user to
perform the following tasks:

1. See any users timeline -- `./twitter timeline zspencer`
1. See any users information (Join date, location, etc.) -- `./twitter info jfarmer`
1. See any users followers -- `./twitter followers <yourhandle>`
1. See who is following any user -- `./twitter following <yourhandle>`
1. Send a tweet -- `./twitter tweet I know kung fu`
1. Send a DM -- `./twitter message zspencer do you know kung fu?`
1. Follow a user -- `./twitter follow jfarmer`
1. Unfollow a user -- `./twitter unfollow zspencer`

## Getting Started

We've provided a very tiny skeleton of a command line application

1. Fork this repository and Clone to your machine
1. CD into this directory
1. Run `bundle install`
1. Create your Application in [Twitters Dev Center](http://dev.twitter.com)
1. Create a `.env` file and place your Twitter credentials in it.
1. run `./twitter`

If you're confused about the `.env` file, see https://github.com/codeunion/dotenv-example.
The dotenv gem is used to manage sensitive information like the Twitter
credentials we'll need to make a Twitter application.

## Helpful Resources

1. [How The Internet Works](docs/internet.md)
1. [Working with Twitter](docs/twitter.md)
1. [Glossary of Terms](docs/glossary.md)

## Bored?

Did you rush through this without breaking a sweat? Here's some additional
challenges:

* Publish this as a gem! - Perhaps load the users credentials from a file in
  their home directory
* Make a Text Messaging app off the [Twilio API](http://www.twilio.com/)
* ???
