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
  * The Birth of the Modern Web
    * Addition of images, audio, richer layouts all came at a cost in performance: more HTTP requests meant more round-trip TCP handshakes and an increase in latency.
    * Modern web apps have a complex dependency graph created with each load of a page.
  * Browser Optimizations
    * Document-Aware Optimizations
      * When the browser leverages networking integrated with parsing techniques to identify and prioritize fetching resources.
      * More efficiently load web pages by prioritizing resources like CSS, layouts, and JS.
    * Speculative Optimizations
      * When the browser learns the nagivation patterns of the user over time and attempts to predict user actions.
      * Pre-resolving DNS names; pre-rendering pages to frequently visited sites; opening a TCP connection in anticipation of an HTTP request when a user hovers over a link.
  * Latency as the main limiter
    * Despite physical network improvements, latency will always exist due to physical distance, material limitations (fiber optic cables, etc.), and the efficiency of the hardware.
    * How can we optimize? Eliminate unnecessary roundtrips, minimize resources to fetch, etc.
  * Further Optimizations
    * Do you need all of those resources?
      * Limit resources to be fetched, limit page bloat, don't require unnecessary files
    * Compression techniques
      * Reduce size of resources to be fetched, not just numbers.
      * Using `gzip` on HTML, CSS, and JS can reduce their size by 60-80%
      * Minifying files-- nix white-space, comments & formatting, use short var/method names
        * Resources: https://developers.google.com/speed/docs/insights/MinifyResources
    * Reusing TCP connections
      * Use a keepalive TCP connection instead of opening new ones 
        * Standard in HTTP/1.1 and newer
        * Achievable in HTTP/1.0 by passing `Connection: keep-alive` header
    * DNS optimizations
      * How can we minimize DNS lookups required?
        * Reduce number of hostnames to be resolved (eliminate dependencies)
        * Download external resources and host them locally on the server
        * Use a faster DNS provider (Amazon Route 53 or DNS Made Easy instead of GoDaddy)
    * Caching
      * Server-side caching is useful in the case of content dynamically generated by the server
      * Non-trivial solution: separate architecture component (save this for later)

* Browser Networking APIs
  * HTTP and Real-Time Data Synchronization
    * Request/Response model is poorly suited to Real-Time Data Sync-- use browser APIs.
  * XHR (XMLHttpRequest)
    * Enables clients to manage requests and responses programmatically and asynchronously.
    * Key component of AJAX-- update individual pieces of a page through DOM manipulation.
    * Polling: issue a periodic request to the server to check for updates (think Twitter feed).
      * Long-polling: client makes a request, server keeps connection idle until an update is available and *then* it issues a response.
  * SSE (Server-Sent Events)
    * Enables efficient server-to-client streaming of text-based event data
    * Enables efficient, low-latency server-to-client streaming of text-based data in which the client initiates a connection and the server streams updates to the client.
    * After the initial handshake, the client can no longer send data to the server using that connection, instead it's reserved for the server providing real-time updates to the client.
    * Leverages the delivery of messages over a single, long-lived TCP connection-- reduces round-trip time, and messages are pused to the client when they become available on the server.
    * Drawbacks:
      * Only works with a client-server model
      * Does not allow for request streaming such as when streaming a large upload to the server
      * Streaming support specificially designed to transfer UTF-8 data, inefficient for binary
  * WebSocket
    * Enables us to layer and deliver arbitrary application protocols between client and server such that either side can send data to the other at any time (bidirectional communication).
    * Low latency delivery of text and binary app data in both directions.
    * Offloads responsibility for state management, compression, caching, etc. to the browser.
    * Used for Capstone projects like Spacecraft!

* Peer to Peer (P2P) Networking
  * Instead of a client and a server, each computer in the network acts as a 'node'.
    * Each node is capable of performing both typical "client" and "server" functions.
    * Underlying infrastructure is the same as a client-server architecture (TCP or UDP, etc.)
  * Use Cases
    * No need to set up and maintain a server to provide functionality, just need two nodes.
    * More resilient because of the lack of reliance on a central server.
    * No need for each communication to be routed through a central point-- reducing latency by giving shorter paths between a client and a server (better for Real Time Communication).
  * Complexities of P2P
    * Discovery is an issue
      * IP addresses of devices may not be fixed
      * Nodes might be online or offline at various times
    * Solvable through *flooding*-- a message sent to network and each node forwards it until a specified number of network 'hops' have elapsed.
    * More structured approach is to use a Distributed Hash Table (**DHT**): a table of key/value pairs.
    * Hybrid model: including a central server that enables nodes to discover each other.
      * Nodes have a client-server relationship with the server and P2P with other nodes.
    * Other issues: connection negotiation and establishment, security, performance, scaling
  * WebRTC
    * Provides real-time communication functionality with in the browser (node in P2P network).
    * A collection of standards, protocols, and APIs available in most modern web browsers.
    * Abstracts away the complexities of establishing P2P communication btw nodes.
    * Capstone projects again! Conclave, Layr, Xorro