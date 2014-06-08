# Working with OAuth

## Why OAuth?
In order to understand [OAuth](glossary.md#oauth), it helps to understand who
all the participants are and their motivations.


1. The provider of the [web service](glossary.md#web-service-or-web-api)
1. The user of the web service (via having a twitter account) and the application
1. The developer of the application which interacts with the web service

API providers want to monetize access to a web service. Twitter, Google, etc.
charge applications which have thousands of users that use their API. To do
that, they have to know which application is requesting the API; hence the
[Consumer Key](docs/glossary.md#consumer-key).

Users want to be able to use apps that interact with a platform like Twitter or
Facebook without worrying that a rogue developer will steal their account.
Hence the [Access Token](glossary.md#access-token) and [Access
Secret](glossary.md#access-token-secret); which keep the users password out of
the developers grubby hands.

Developers want to create new and interesting uses for the [data](glossary.md)
in a web service without having to reinvent the wheel every time they want to
use a new service. Because OAuth is a [protocol](glossary.md#protocol) you can
easily re-use code that implements it.

OAuth is designed to meet these concerns. It provides a standard
protocol for:

1. [Authenticating](glossary.md#authentication) users of a web service to an application
2. Letting users manage what custom applications [authorized](glossary.md#authorization) may do
3. Security every [HTTP request](glossary.md#request)

## How It Works

