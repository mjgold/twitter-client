## Glossary of Terms
This is a series of short, precise, and accurate unofficial definitions intended
to create a limited understanding. Memorizing strongly discouraged. Referencing
strongly encouraged.

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
[HTTP requests](#http-request) that carry credit card or password data.

#### H

##### HTTP (HyperText Transfer Protocol)
A [protocol](#protocol) used to transmit data on [the Web](#web). It is
[client-server](#client-server) based and built on top of the [Internet
Protocol](#ip-internet-protocol). HTTPS is an alternative protocol used to transfer
data securely using [encryption](#encryption).

Reference [How HTTP Works](internet.md#how-http-works) for a more detailed
illustration.

##### HTTP Request
HTTP requests are part of the [Request/Response Cycle](#request-response-cycle).
Requests are composed of a [method](#http-method), a
[URL](#url-universal-resource-locator), [headers](#http-headers), and sometimes
a [body](#http-body). They are sent to a [server](#server), which processes the
request and creates a [response](#http-response)

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


#### W

##### Web
The Web is used to reference interconnected [web pages](#web-pages) served up over
[HTTP](#http). This is not to be confused with the [Internet](#internet)

##### Web Service (or Web API)
A web service (or web [API](#api) is a program hosted on [the web](#web) designed to
be used by other programs instead of humans. For instance, you could write a
lunch decider app that interacts with the [Yelp
API](http://www.yelp.com/developers/documentation/v2/search_api) and selects a
single location based upon whatever criteria you like.

To use a web service, your program sends [requests](#http-request) to a
[url](#url-universal-resource-locator) and gets [data](#data) back, often
[encoded](#encoding-and-decoding) in [JSON](#json-javascript-object-notation).
