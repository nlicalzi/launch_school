## RB175 Networked Applications: Lesson Notes

### Rack

* What is Rack?
  * A generic interface (~protocol) to help application developers to connect to web servers.
  * A specification of what a server should send to an app, and what an app should send to a server.
* Can be used to help connect to WEBrick, an HTTP server toolkit gem for Ruby.
* Requires a `rackup` config file w/ ext. `.ru` that is a Ruby object and will respond to `call(env)`
  * `call(env)` always returns an array containing a *status code*, *headers*, and a *response body*.
    * Status code: a string or another object that can respond to `to_i`
    * Headers: a hash consisting of key-value pairs
    * Response body: any object, as long as it responds to an `each` method and yields a `String`
    * `require_relative` our app file, and call `run` on the app we want to run



### General

* What is an application server?
* What is a web server?
* What is a view template?
  * What do we call a file that allows us to do some pre-processing on the server side in a programming language before translating programming code into a string to return to the client (usually HTML)?
* What templating engine allows us to embed Ruby directly into HTML?
  * What is `erb` / an `.erb` file?
* Describe the parties / roles / relationships at each step of the following diagram(s)
  * ![img](https://miro.medium.com/max/1046/1*k7cbm7xNb31rNwTDnsWvgQ.png)
  * ![img](https://miro.medium.com/max/1962/1*Z2ftxFcb03ZVU7Uml-SdIg.png)