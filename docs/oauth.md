# Working with OAuth

## Why OAuth?
In order to understand [OAuth](glossary.md#oauth), it helps to understand who
all the participants are and their motivations.


1. The provider of the [web service](glossary.md#web-service-or-web-api)
1. The user of the web service (via having a twitter account) and the application
1. The developer of the application which interacts with the web service

API providers want to be able to monetize access to their web services
(twitter, google, etc. all charge for high usage access to the API). This means
they need to be able to identify each application that uses the API; hence
needing to register your application before you can interact with Twitter.

Developers want to create new and interesting uses for the [data](glossary.md)
in the web service without having to reinvent the wheel every time they want to
use a new service. Developers also want low barriers to entry for the user, and
demanding that a user hand over their google password to use some google
integrations for an application is a huge leap of trust.

Users want to get the features provided by an application without worrying
about a rogue developer taking over their account.

OAuth is designed to meet all of these concerns. It provides a standard
protocol for:

1. [Authenticating](glossary.md#authentication) users of a web service to an application
2. Letting users manage what custom applications [authorized](glossary.md#authorization) may do
3. Transmitting authentication and authorization data on every [HTTP
   request](glossary.md#request)


## How It Works



