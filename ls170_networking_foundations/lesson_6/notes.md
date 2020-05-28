## LS170 Lesson 6: The Evolution of Network Technologies



### Overview

1. What to Focus On

   * Be aware of how and why HTTP is evolving
   * Be aware of the functionality that browser APIs can provide
   * Be aware that Client-Server isn't the only network paradigm

2. HTTP: Past, Present, and Future

3. Web Performance and HTTP Optimizations

4. Browser Networking APIs

5. Peer to Peer Networking

   

### Summary



### Notes

* HTTP: Past, Present, and Future
  * HTTP/0.9
    * Was known as the 'one-line protocol' for the simplicity of a request
    * Responses were a single hyper-text document, with no headers/metadata
    * Single request-response cycle per TCP connection (request, response, server closed)
  * HTTP/1.0
    * Between 1991 and 1996, the table was set for mass adoption of the internet/web:
      * Browser tech improved (Mosaic -> Netscape Navigator 1.0)
      * Telecom companies started providing dial-up connections (~56kbps)
      * World Wide Web Consortium (W3C) and the HTTP Working Group (HTTP-WG) were formed
      * HTTP saw its limited capabilities expanded-- RFC1945 announced HTTP/1.0
        * The addition of `HEAD` and `POST`
        * Inclusion of a status line
        * Addition of HTTP headers (meta-data for requests and responses)
          * `Content-Type`, for ex. allowed new types of data transmission
  * HTTP/1.1
    * Released as RFC2068 in 1997, updated as RFC2616 in 1999-- first standard version of HTTP
    * Provided connection re-use: one TCP connection could now make multiple requests
      * Embedded links, CSS, JS-- each previously needed to be fetched with a separate request
      * Reduced latency overhead-- eliminated redundant TCP handshakes
      * Enabled pipelining-- no wait for a response before sending more requests
    * Addition of more HTTP methods: `PUT`, `DELETE`, `TRACE`, and `OPTIONS`
  * HTTP/2
    * Standardized in 2015, as HTTP/1.1 struggled with increasing complexity of the web
      * More and more visual data and embedded files, AJAX, all need more HTTP requests, adding up to potentially dozens just to load a single web page and its functionality successfully
    * HTTP/2 allowed for multiplexed requests, improving on previous pipelining-- multiple requests now sent in parallel instead of relying on message order.
  * HTTP/3
    * Work in progress
    * Eliminates reliance on TCP & TLS by using QUIC (Quick UDP Internet Connections) protocol
      * TCP is implemented in OS kernels and firmware, updating it is almost impossible, but UDP can be changed and improved
    * https://dev.to/grigorkh/what-is-http3--4pib
    * https://http3-explained.haxx.se/en/

* Web Performance and HTTP Optimizations

* Browser Networking APIs

* Peer to Peer Networking