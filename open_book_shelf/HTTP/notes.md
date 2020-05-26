## Notes on the Intro to HTTP book at LS

Source: https://launchschool.com/books/http

Useful Resources:

* Paw: https://paw.cloud/
* Insomnia: https://insomnia.rest/
* Postman: https://www.postman.com/



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

      1. URL Components

         * What is created by combining a scheme, a host, a port, a path, and an optional query string? (What are the component parts of a URL?)

         * Name each individual piece of the following text: http://www.example.com:88/home?item=book" 
           * Scheme: http
           * Hostname: www.example.com
           * Port: :88
           * Path: /home/
           * Query string (optional): ?item=book
         * What part of a URL tells the web client how to access the resource? (What the scheme section of a URL tell us?)
         * What part of a URL tells the web client where the resource is hosted? (What does the hostname section of a URL tell us?)
         * What part of a URL tells us what local resource is being requested? (What does the path section of a URL tell us?)
         * What part of a URL is used to send data to the server? (What does the query string section of a URL tell us?)
         * What is the default port number that HTTP requests use? (What can we accomplish by specifying a port number other than 80 for an HTTP request?)

      2. Query Strings / Parameters

         * What is the reserved character that marks the beginning of a query string in a URL? (What does  `?`  signal in a URL?)
         * What is the reserved character that is used to add an additional parameter to a query string in a URL? (What does `&` signal in a URL?)
         * Why are query strings only used in `HTTP GET` requests? (What kind of requests use query strings passed in through a URL?)
         * What kind of HTTP request do we use when we type in a URL into the address bar of our browser? (How do we most commonly issue an `HTTP GET` request?)
         * Query strings have a max length, are visible (not suitable for passing username/password), and preclude the use of spaces or `&` (reserved character) without URL encoding.

      3. URL Encoding

         * How can we include non-ASCII, unsafe, or reserved characters in a URL? (When must a character be URL encoded?)
         * What is a `%` followed by two hexadecimal digits, in the context of a URL? (What symbol denotes the start of a URL encoded character?)

   3. Preparations

      1. HTTP Command line Tools
         * What command line tool can we use to issue HTTP requests? (What is `curl`?)

2. HTTP

   1. Making Requests
      * How can we see the raw response data of an `HTTP GET` request, rather than having a browser parse and process it? (What is an HTTP tool like `curl` or Insomnia used for?)
      * How can we see each individual `HTTP GET` request sent upon navigating to a website? (What can we inspect by using Chrome -> Dev Tools -> Network?)
      * How can we tell HTTP the desired action to be performed on the resource? (What is an HTTP Request Method?)
      * What is the result of every HTTP request (minus timeouts)? (What is an HTTP response?)
      * What HTTP Request Method can we use to retrieve a resource? (When do we use HTTP GET?)
      * What HTTP Request Method can we use to initiate some action on a server or send data to a server? (When do we use HTTP POST?)
      * What is the most common use of HTTP `POST` from within a browser? (What HTTP Request Method do we typically use when submitting a form?)
      * What are the advantages of using POST over GET in submitting a username and password to a server? (How can we sidestep the query string size limitation and public-facing nature of an HTTP GET request when logging in to a server?)
      * What allows the client and the server to send additional information during the request/response HTTP cycle? (What is an HTTP header?)
      * What part of the request being sent to the server is used to give more information about the client and the resource to be fetched? (What are HTTP Request headers?)
      * **Summary**:
        * HTTP Method
        * Path
        * Headers
        * Message body (for `POST` requests)
   2. Processing Responses
      * What do we call the raw data returned by a server after an HTTP request? (What is an HTTP response?)
      * What do we call the three digit number signifying the status of the request that the server sends back after receiving a request? (What is an HTTP Status code?)
      * What HTTP Status Code pairs with the Status Text: "OK", "Found", "Not Found", and "Internal Server Error"? (What HTTP Status Text pairs with the code: 200, 302, 404, and 500?) (x5)
      * What HTTP Status Code is returned when a resource has been moved, so the browser knows it should expect to follow the `redirect` URL in the `Location` response header? (What does an HTTP Status Code of 302 Found mean?)
      * What HTTP Status Code is returned when a request has been handled successfully? (What does an HTTP Status Code of 200 OK mean?)
      * What HTTP Status Code is returned when a requested resource cannot be found? (What does an HTTP Status Code of 404 Not Found mean?)
      * What HTTP Status Code is returned when the server has encountered a generic error? (What does an HTTP Status code of 500 Internal Server Error mean?)
      * What part of an HTTP Response contains additional meta-information about the data being returned? (What does an HTTP Response Header contain?)
      * **Summary**: (most important parts of an HTTP response)
        * Status Code
        * Headers
        * Message body, containing raw response data
   3. Stateful Web Applications
      * **Sessions**
        * What do we call a piece of data that is used in network communications to identify a session, or a series of related message exchanges? (What is a session identifier?)
        * How do web developers create a sense of a persistent connection between requests (faux statefulness)? (Why would a web developer use a session identifier?)
      * **Cookies**
        * What do we call a small piece of data sent from a website and stored on the user's computer while the user is browsing that can act as a session identifier? (What is an HTTP cookie?)
        * How does a server set a cookie in a requesting client's browser, initializing a session identifier? (What does a **set-cookie** header do in an HTTP Response?)
        * What workaround is achieved when a session id is generated by/stored on a client and used as a "key" to the session data stored server side? (How do web applications work around the statelessness of HTTP?)
      * Asynchronous JavaScript calls, or **AJAX**
        * What does AJAX stand for? (What is the common abbreviation for Asynchronous JavaScript Calls?)
        * What is a piece of logic that you can pass on to some function to be executed after a certain event has happened? (What is a `callback`?)
        * What is the difference between an AJAX request and a normal request? (When is a request processed by a callback function (usually some client-side JavaScript code) instead of the browser refreshing and processing a response?)
   4. Security
      * Which Application layer protocol encrypts every request/response before it is transported over the network? (What is the difference between HTTP and HTTPS?)
      * What cryptographic protocol does HTTPS use for encryption? (What is the Transport Layer Security protocol (TLS)?)
      * Under what policy does a web browser permit scripts contained in a first web page to access data in a second web page if both have the same origin (a combination of URI scheme, host name, and port number)? (What is the same-origin policy?)
      * What do we call the mechanism that allows interactions that would normally be restricted cross-origin to take place? (What is cross-origin resource sharing (CORS)?)
      * What process adds new HTTP headers, allowing servers to share resources cross-origin to certain specified origins? (How does CORS (cross-origin resource sharing) work?)
      * What do we call the exploitation of a valid computer session (session id) to gain unauthorized access to information or services in a computer system? (What is session hijacking?)
      * What do we call it when a successful login renders an old session id invalid, creating a new one? (How does resetting sessions solve the session hijacking issue?)
      * What do we accomplish by setting an expiration time on sessions? (How does setting an expiration time solve the session hijacking issue?)
      * What are three main countermeasures for session hijacking? (What problem are we trying to solve by implementing resetting sessions, setting a session expiration time, or using HTTPS across the entire app?)
      * What do we call the type of attack where users are allowed to input HTML or JavaScript that ends up being displayed by the site directly? (What is Cross-site Scripting (XSS)?)
      * What do we accomplish by sanitizing our HTML inputs in an app? (How can we account for the possibility of a Cross-site Scripting (XSS) attack?)
   5. Conclusion
      * Understanding HTTP and things like `GET`, `POST`, sessions, cookies, and what it means to be "stateless" is vital
      * Understanding the basics of HTTP means you know what is happening "behind the scenes" when you build a web application
      * Learning about security means you're aware of threats like `XSS` and session hijacking, as well as the countermeasures you need to guard against them