# How the Internet Works

The [Internet](glossary.md#internet) is an amazing piece of technology.
Originally invented for DARPA and quickly adopted for sharing research between
universities; the Internet has taken the world by storm. Most of us think of the
Internet as a magical resources that flies through the air to bring us youtube
videos.

In fact, it's a highly complex system of well designed
[protocols](glossary.md#protocol) that computers use to communicate between each
other.

This [brief video](https://www.youtube.com/watch?v=i5oe63pOhLI) explains how
data flows over the Internet in a much better way than I can.

### The Request/Response Cycle
As a developer building web applications and clients, your primary concern is
with the [request/response cycle](glossary.md#request-response-cycle).

The Request/Response cycle is how web pages are loaded. Every time you click a
link or submit a form in your browser you are actually creating an [http
request](glossary.md#request) that you're sending to a server. The server then
builds a [response](glossary.md#response) of HTML [data](glossary.md) and sends
it back to you. Once it's all back at your computer your browser presents that
as a web page.

### Making an HTTP Request Via the Command Line
Explore this now by opening up your terminal, and running `curl --get "http://codeunion.io"`

Did you see all that  text print into your terminal? As you explore it further,
you'll notice that text is HTML that represents the
[codeunion.io](http://codeunion.io) website!


Let's break that command down, shall we?

* `curl` is a program you can use to send http requests from your command line.
  I use it all the time when working with APIs to see how the data comes back.
* `--get` is a flag being passed into curl that says to use the [HTTP GET
  method](glossary.md#http-methods) to retrieve some data
* `http://codeunion.io` is the [URL](glossary.md#url-uniform-resource-locator) (or web address) to
  retrieve data from.

Using this power, you can now request any public website and see what it looks
like under the covers! Try it out! We'll wait for you!

### Understanding URLs

Before we can go further, we should understand the different parts of a URL.
Take for example: `http://www.yelp.com/search?find_desc=tacos&find_loc=Downtown+Oakland%2C+Oakland%2C+CA`

This url has 4 parts:

* The `scheme` - states which [protocol](#protocol) this URL uses. It is the
  first part of the URP and extends up until the `://`
* The `domain` - identifies the website you are on.
* The `path` - tells which file on the website you're looking for. It runs up to
  (but doesn't include!) the `?`
* The `query string` - This provides additional data to the server to customize
  your request. It starts just right of the `?` and ends at the end of the url.

Wikipedia has an in depth breakdown of all the different [parts of a
URL](https://en.wikipedia.org/wiki/Uniform_Resource_Locator#Syntax)

You'll notice this URL contains odd strings like `%2C` and `+` in it. The `%2C`
replaces the `,` character, and the `+` replaces the ` ` character; neither of
which are allowed in URLs. If you want to see what they would be, we must
[decode](glossary.md#encoding-and-decoding) the URL. Let's [use ruby to do
it!](http://www.ruby-doc.org/stdlib-2.1.1/libdoc/uri/rdoc/URI/Escape.html#method-i-escape)


Open an IRB session and try:

```
require 'uri'
URI.decode("http://www.yelp.com/search?find_desc=tacos&find_loc=Downtown+Oakland%2C+Oakland%2C+CA")
```

### Accessing Web Services

[Web services](glossary.md#web-service-or-web-api) like the twitter client you
are building do the same thing as your browser. Your app will send [GET and
POST](glossary.md#http-methods) requests to twitters' [web
service](glossary.md#web-service). Twitter will respond to each request with a
[JSON](glossary.md#json-javascript-object-notation)
[encoded](glossary.md#encoding-and-decoding)
