## Glossary of Terms
This is a comprehensive series of short, precise, and accurate unofficial
definitions of terms you'll experience this week. It can only create a surface
level understanding.

Memorizing strongly discouraged. Referencing strongly encouraged.

#### Authentication
Authentication is how an application identifies you. At the user level, this is
often by using a  username/password combination. At the application level, this
is often using an API Key and a shared secret.

Not to be confused with [Authorization](#authorization).

#### Authorization
Authorization is how an application decides what someone is allowed to do. For
instance; you may be allowed to deposit money into any bank account; but you can
only withdraw money from your own. Authorization is usually dependent on valid
[Authentication](#authentication).


#### Authorization Contexts
The Twitter API allows your application to work in two contexts: the application
context and the user context.

* The Application context identifies each request as your application to twitter
  using a Consumer Key (Sometimes called an API Key) and a Consumer Secret
  (sometimes called an API Secret).
* The User context requires all the data the Application context requires, plus
  an Access Token (sometimes called a user token) and an Access Token Secret
  (sometimes called a user secret)

These 4 pieces of [data](#data) are used to create the [Authorization
header](#http-headers) that is part of an [OAuth](#oauth) [request](#request).

#### API (Application Programmable Interface)
An API is a way to expose parts of a program so other programs may use it.

APIs can be built on the [Web](#web) as [Web
Services](#web-services-or-web-apis) or they can be programs running on your
computer.

An example of an API for a program are browser plugins. Plugins such as [Hey
Girl](https://chrome.google.com/webstore/detail/hey-girl/jcpmmhaffdebnmkjelaohgjmndeongip)
and [Mustachio
Redux](https://chrome.google.com/webstore/detail/mustachio-redux/hbnnipmnpgiepegnlmekieblhjmchmbf)
use the browsers api to change pictures as you browse the web.

#### C

##### Client/Server Model
The client/server model is a common approach to sharing [data](#data) between many
programs. This week, twitter's [web service](#web-service-or-web-api) will act as the
server; and the program you build will be the client.

The server is responsible for storing data and ensuring the client only
interacts with the data i,'s allowed to, and the client is responsible for
handling the user interactions.

#### D

##### Data
Data is a hard concept to explain. Think of it as the value of a variable. Take
the following code:

```ruby
name="Zee"
beard_length=9001
skills=[:programming, :typing, :sleeping, :grumping]
```

The data contained in `name` is the string "Zee". The data contained in the
variable `skills` is an array of 4 symbols. Data can be transformed into
different [formats](#data-formats) through the process of
[encoding](#encoding-and-decoding)

##### Data Formats
Data formats are how you can represent data to either a person or program. CSV's
are a type of data format designed to represent spreadsheets.
[JSON](#json-javascript-object-notation) is another common data format for
transferring data between programs over the [Internet](#internet). HTML is a
data format for presenting data in a human readable way in a browser.

#### E

##### Encoding and Decoding
Encoding is the process of turning [data](#data) from one form to another.
I've encoded an important message: "Ogrammingpray isay awesomeay." Your brain
has probably "decoded" this message into "Programming is awesome." Encoding
allows you to put data into a [format](#data-formats) that other programs can read.


##### Encryption
Encryption is a form of [encoding](#encoding-and-decoding) [data](#data) so it
is only readable by parties who are allowed to read it. It's often used for
[HTTP requests](#request) that carry credit card or password data.

#### H

##### HTTP (HyperText Transfer Protocol)
A [protocol](#protocol) used to transmit data on [the Web](#web). It is
[client-server](#client-server-model) based and built on top of the [Internet
Protocol](#ip-internet-protocol). HTTPS is an alternative protocol used to transfer
data securely using [encryption](#encryption).

Reference [How HTTP Works](internet.md) for a more detailed
illustration.

##### Headers
Every HTTP [Request](#request) and [Response](#response) has
[metadata](#metadata) attached to it. This week, only a few [
headers](https://en.wikipedia.org/wiki/List_of_HTTP_headers#Request_Headers) are
likely to be important:
* [Authorization](#authorization) - Identifies the sender of the request to the web serice
* Content-Type - States the [data format](#data-format) of the request or
  response body.

##### HTTP Methods
There are four main "verbs" used in [web services](#web-services-or-web-apis):
* GET - Retrieves data from the service
* POST - Adds data to the service
* PUT - Replaces data in the service
* DELETE - Removes data from the service

Every [HTTP Request](#request) uses one of these verbs in conjunction with
a [URL](#url-uniform-resource-locator) to change [data](#data) in the web
service.

#### I

##### Internet
The Internet is used to describe all of the different services like email,
websites, chat, games, etc. that communicate over the [Internet
Protocol](#internet-protocol).

##### IP (Internet Protocol)
The Internet Protocol is a [protocol](#protocol) that defines how computers on
the [Internet](#internet) send [packets](#packets) of information.
websites, chat, etc. that communicate over the [Internet
Protocol](#ip-internet-protocol).


#### J

##### JSON (JavaScript Object Notation)
JSON is a very common [data format](#data-format) used in [web
services](#web-service-or-web-api). It is very human readable, and supported in many
languages. The following is supermans hero information in a ruby hash and the
JSON equivalent:

```ruby
{
  :alias => "Superman",
  :name => "Clark Kent",
  :years_active => 60,
  :powers => ["flight", "xray_vision", "heat_vision", "invincibility"]
}
```
now in JSON
```json
{
  "alias": "Superman",
  "name": "Clark Kent",
  "years_active": 60,
  "powers": ["flight", "xray_vision", "heat_vision", "invincibility"]
}
```

#### O

##### OAuth

OAuth is a [protocol](#protocol) built on top of
[http](#http-hypertext-transfer-protocol) to allow [client
applications](#client-server-model) to access a users data without needing to
store their password. You will use the [authorization
header](http://oauth.net/core/1.0/#auth_header) to provide the twitter
[web-service](#web-service-or-web-api) with the appropriate [user context](#authorization).

For more details; check out our [OAuth guide](docs/oauth.md)

#### P

##### Protocol
Protocols define how computers communicate. There is a wide ecosystem of
protocols, each with different purposes. They are often specified using a
[Request for Comment](#rfc-request-for-comment). There are many kinds of
protocols with different purposes. SMTP, POP and IMAP are all for email;
[HTTP](#http-hypertext-transfer-protocol) is for web pages; Jabber (or XMPP) is
for chat, and many many more. Don't worry about learning the protocols details
at the moment.

#### R

##### Response
HTTP Responses are returned from the [web service](#web-service-or-web-api) to the
[client](#client-server-model) who sent the [request](#request). Responses are
composed of a [status code](#status-codes), some [headers](#http-headers), and a
body that contains [data](#data).

##### Request
HTTP requests are one half of the [Request/Response Cycle](#request-response-cycle).
Requests are composed of a [method](#http-methods), a
[URL](#url-uniform-resource-locator), [headers](#http-headers), and sometimes
a body.

##### Request/Response Cycle
HTTP works by connecting the client and [web service](#web-service-or-web-api) for a single
transaction.

The [client](#client-server-model) sends a [request](#request) to the server for
processing. Once the server finishes it creates a [response](#response) and
sends it back to the client.

For more information, read [How HTTP Works](internet.md)


##### RFC (Request For Comment)
RFCs are public documents outlining a standard in the technology industry. While
exhaustive and academic, they provide all the information necessary to implement
a standard. They are often used for reference.

[RFC 2616](http://www.faqs.org/rfcs/rfc2616.html) exhaustively documents how to
implement [HTTP](#http-hypertext-transfer-protocol). Don't worry, it's only 147
pages!

A more readable one is [RFC4180](https://www.rfc-editor.org/rfc/rfc4180.txt)
which specifies how to format CSV files in a mere 7 pages.

Not all RFC's are computer focused, [RFC
2119](https://www.ietf.org/rfc/rfc2119.txt) is an RFC for people who write RFCs!


#### S

##### Status Codes

Status codes are part of the [response](#response) that carries quite a bit of
information. Status codes start with the numbers 1 to 5, and each have specific
meaning:
* 1XX - Informational
* 2XX - Success
* 3XX - Redirection
* 4XX - Client Error
* 5XX - Server Error

The most common status codes are:

* [200 OK](https://httpcats.herokuapp.com/200) - Everything went great
* [404 Not Found](https://httpcats.herokuapp.com/404) - The
  [URL](#uniform-resource-locator) you requested doesn't exist
* [401 Unauthorized](https://httpcats.herokuapp.com/401) - The
  [Authorization](#authorization) [header](#http-headers) you included doesn't
  permit you to access the [url](#uniform-resource-locator) you requested

A more comprehensive list [may be found on
wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

#### U

##### URL (Uniform Resource Locator)
The Uniform Resource Locator, often called the web address, is a mainstay of the
[Internet](#internet). It's used to identify where a resource lives on the
Internet in a human-and-robot readable fashion.

#### W

##### Web
The Web is used to reference interconnected web sites served up over
[HTTP](#http-hypertext-transfer-protocol). Easily confused with the
[Internet](#internet)

##### Web Service (or Web API)
A web service (or web [API](#api) is a program hosted on [the web](#web) designed to
be used by other programs. Using Yelps API you could write a
lunch decider app that interacts with their [search
API](http://www.yelp.com/developers/documentation/v2/search_api) and selects a
single location based upon whatever criteria you like.

To use a web service, your program sends [requests](#request) to a
[url](#url-uniform-resource-locator) and gets [data](#data) back, often
[encoded](#encoding-and-decoding) in [JSON](#json-javascript-object-notation).
