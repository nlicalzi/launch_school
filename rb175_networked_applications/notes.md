## RB175 Networked Applications: Lesson Notes



### Handling Requests Manually

* When we write our own TCP servers, we might call them "HTTP servers", because we're sending HTTP-compliant requests and responses using the TCP connection.
  * ![Server TCP server](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/server-zoom-tcp-ruby.png)

* We're using the `TCPServer` class from Ruby, which is subclassed from `Socket`