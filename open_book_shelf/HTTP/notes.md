## Notes on the Intro to HTTP book at LS

Source: https://launchschool.com/books/http

Useful Resources:



### Summary



### Notes

1. Background
   1. Background
      1. Overview & History
         * HTTP follows a simple model where a client makes a request to a server and waits for a response. (Why is HTTP referred to as a request response protocol?)
         * HTTP/0.9 (1991) had the ability to transmit HTML pages
         * HTTP/1.0 (1992) added transfer of CSS, videos, scripts, and images
         * HTTP/1.1 (1995) enabled the reuse of established connections for subsequent requests
         * HTTP/2 (2015), HTTP/3 (in dev), etc.
      2. How the Internet Works
         * An IP Address acts as the identifier for a device or server, and can contain hundreds or thousands of ports, each used for a different communication purpose to that device or server.
         * How does your computer know what IP address a URL is mapped to? (DNS)
         * DNS is a distributed database which translates computer names like URLs to an IP adress and maps the request to a remote server. (What is the Domain Name System (DNS)?)
         * What happens if a DNS server does not contain a requested domain name? (When would a DNS server route a request to another DNS server up the hierarchy?)
         * When your browser issues a request, it's simply sending some text to an IP address. Because the client and server have an agreement, or protocol, in the form of HTTP, the server can take apart the request, understand its components, and send a response back to the web browser.
         * Name the five different pieces of the below diagram (Anki card w/ redactions)
           * ![Internet](https://d186loudes4jlv.cloudfront.net/http/images/internet.png)
      3. Clients and Servers
         * What trype of client is responsible for issuing HTTP requests and processing the HTTP response in a user-friendly manner onto your screen? (What is a Web Browser?)
         * What do we call a machine that handles inbound requests and issues responses? (What is a Server?)
      4. Resources
         * What is the generic term for things you interact with on the Internet via a URL-- files, web pages, software, etc? (What is a resource?)
      5. Statelessness
         * What can we call a protocol designed in such a way that each request/response pair is completely independent of the previous one? (What makes a protocol stateless?)
         * Are HTTP requests/responses dependent on previous requests/responses? (Why can we say HTTP is a stateless protocol?)
         * Why do web developers have to work hard to simulate a stateful experience in web applications? (What is one result of HTTP being a stateless protocol?)
   2. What is a URL?
      1. Introduction
      2. URL Components
      3. Query Strings / Parameters
      4. URL Encoding
      5. Summary
   3. Preparations
      1. HTTP GUI Tools
      2. HTTP Command line Tools
2. HTTP
   1. Making Requests
   2. Processing Responses
   3. Stateful Web Applications
   4. Security
   5. Conclusion