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

1. Requesting and receiving a users access token.
1. [Authenticating](glossary.md#authentication) users of a web service to an application
1. Letting users manage what custom applications [authorized](glossary.md#authorization) may do
1. Securing every [HTTP request](glossary.md#request)

## How It Works

OAuth works by storing some [encrypted](glossary.md#encryption) data in the
[Authorization](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.8)
[Header](glossary.md#header) of an
[HTTP](glossary.md#http-hypertext-transfer-protocol) request.

This encrypted data identifies:

1. Which application is making the request against the API
2. Which user is making the request through the application
3. Which [URL](#url-uniform-resource-locator) is being used in the request

If you were to look at the Authorization header, you would see several key-value pairs:
* `oauth_consumer_key` - This is the [Consumer Key](glossary.md#consumer-key) of your application
* `oauth_nonce` - A one time use string used to
  [encrypt](glossary.md#encryption) the `oauth_signature`. (See [cryptographic
  nonce](https://en.wikipedia.org/wiki/Cryptographic_nonce))
* `oauth_signature` - a
  [hash](https://en.wikipedia.org/wiki/Cryptographic_hash_function) of the
  request url (including [query variables](glossary#query-variables), consumer secret, and access token
  secret
* `oauth_signature_method` - The hashing function used to make the hash
* `oauth_timestamp` - The time the `oauth_signature` was generated
* `oauth_token` - This is the [Access Token](glossary.md#access-token) for the user using your application
* `oauth_version` - Which version of oauth the server should use to interpret the header.

Because these are sent with every request it gives the web service provider the
ability to prove that a request is coming from who it comes from.  It also lets
the user choose to prevent an application from acting on their behalf by
revoking their access token for that application.

All things considered; OAuth is a pretty complicated but useful piece of software!
