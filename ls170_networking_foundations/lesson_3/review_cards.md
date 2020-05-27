## LS170 Lesson 3: Intro to HTTP Anki Cards



### Focus:

 * Develop a clear understanding of the role of HTTP
   	* How does the web function as a combination of multiple different technologies?
   	* What is the specific role that HTTP plays in this?
 * Break things down into individual components
   	* Ensure clarity in mental models: break HTTP, URLs, etc. into components and purposes



### Cards:

* The Application Layer
  * What is the topmost protocol layer in both the TCP/IP and OSI models? (What is the Application protocol layer?)
  * What are some of the most common Application layer protocols? (What are FTP, SMTP, and HTTP?)
  * What is one result of the existanct of so many different applications, each with different requirements for how to communicate at a syntactical level? (Why are there so many different Application layer protocols?)
* Domain Name System
  * What do we call the distributed database that translates domain names to IP addresses, allowing humans bypass memorizing complicated strings of integers in favor of URLs? (What is the Domain Name System (**DNS**)?)
  * How does your computer know what IP address a given URL is mapped to? (What is the result of performing a DNS lookup?)
* URI
  * What is the term for an identifer for a particular resource within an information space? (What is a Uniform Resource Identifier (URI)?)
* URL
  * What is the subset of subset of Uniform Resource Identifiers (URIs) that, in addition to identifying a resource, provide a means of locating the resource by describing its primary access mechanism (e.g. its network 'location')? (What is a Uniform Resource Locator (URL)?)
  * What are the 5 typical components of a URL? (What do we create by combining a scheme, hostname, port, path, and query string?)
  * Name each individual piece of the following url: `http://www.example.com:88/home?item=book`
    * Scheme: `http`, hostname: `example.com`, port: `88`, path: `/home/`, query string: `?item=book`
  * What can we use to pass additional data to the server during an HTTP Request? (What is a URL query string?)
  * What part of a URL tells the client how to access the specified resource? (What does the scheme section of a URL tell us?)
  * What part of a URL tells the web client where the specified resource is hosted? (What does the hostname section of a URL tell us?)
  * What part of a URL tells us what local resource is being requested? (What does the path section of a URL tell us?)
  * What part of a URL is used to send data to the server? (What does the query string section of a URL tell us?)
  * What is the default port number for HTTP requests? (What is port `80` used for?)
  * What part of a URL is composed of name/value pairs with each separated by an = sign? (What are the parts of a URL query string?)
  * What character do we use in a URL to indicate the start of our query string? (What does the ? mean in a URL?)
  * What kind of HTTP request is typically issued when we type a URL into the address bar of our browser? (How do we most commonly issue an `HTTP GET` request?)
* URL Encoding
  * What do we call the technique whereby certain characters in a URL are replaced with an ASCII code? (What is URL encoding?)
  * How can we include non-ASCII, unsafe, or reserved characters in a URL? (When must a character be URL encoded?)
  * What is represented by `%` followed by two hex digits in the contest of a URL? (What reserved symbol denotes the start of a URL encoded character?)
  * What are two different ways to encode a space in a query parameter? (What do the following represent: %20 and +?)
* HTTP
  * What command line tool can we use to issue HTTP requests? (What is `curl`?)
  * What can we use to tell HTTP the desired action to be performed on a resource? (What is an HTTP Request Method?)
  * What HTTP request method can we use to retrieve a resource from a URL? (What is HTTP GET?)
  * What HTTP request method can we use to initiate some action on a server or send data to a server? (When do we use HTTP POST?)
  * How can we sidestep the query string size limitation and public-facing nature of an HTTP GET request when attempting to log in to a server? (What are the advantages of using POST over GET in submitting a username and password to a server?)
  * What is the result of every HTTP Request (besides timeouts)? (What results in an HTTP Response?)
  * What do we call the protocol in which a client makes a request to a server and waits for a response? (Why is HTTP referred to as a Request-Response protocol?)
  * What are the component pieces of a single HTTP message exchange? (What results in a Request and Response?)
  * What allows the client and server to send additional meta-information during a request/response HTTP cycle? (What is an HTTP header?)
  * What part of the request being sent to the server is used to give more information about the client and the resource to be fetched? (What is an HTTP request header?)
  * What part of a response being sent to a client contains meta-information about the data being returned? (What is an HTTP response header?)
  * What HTTP status code text pairs with each of the following codes? 200, 302, 404, 500 (What HTTP status codes pair with the following status texts? OK, Found, Not Found, Internal Server Error)
  * What two parties are typically involved in a HTTP exchange? (How do a Client and a Server typically communicate with each other?)
  * What do we call the raw data returned by a server after an HTTP request? (What is an HTTP response?)
  * What are the component parts of an HTTP Request? (What is typically composed of a request line, headers, and an optional body payload?)
  * What are the component parts of an HTTP Response? (What is typically composed of a status line, optional headers, and an optional body payload?)
  * What is the piece of an HTTP Response that indicates the status of the request? (What is an HTTP status code?)
  * What is the the set of rules which provide uniformity to the way resources on the web are transferred between applications? (What is HTTP?)
  * What do we call text displayed on a computer display with references (hyperlinks) to other text that the reader can immediately access? (What is hypertext?)
* Simulating Statefulness
  * What kind of protocol is HTTP, given that each Request/Response cycle is independent of those that came before or after? (Why do we consider HTTP a stateless protocol?)
  * What can we call a protocol designed in such a way that each request/response pair is completely independent of the previous one? (What makes a protocol stateless?)
  * What three techniques can we use to simulate statefulness in HTTP exchanges? (What can we use session IDs, cookies, and AJAX to simulate?)
  * What do we call a piece of data that is used in network communications to identify a series of related message exchanges? (What is a session identifier?)
  * How do web developers create a sense of persistent connection between requests (faux statefulness)? (Why do web developers use session identifiers?)
  * What do we call a small piece of data sent from a website and stored on the user's computer while the user is browsing that can act as a session identifier? (What is an HTTP cookie?)
  * How does a server insert a cookie to a requesting client's browser to act as a session identifier? (What does a **set-cookie** header do in an HTTP response?)
  * What is simulated when a session id is generated by a server and stored by a client, acting as a "key" to the session data that is stored server side? (How do web applications simulate statefulness using HTTP?)
  * What is a piece of logic that you can pass on to some function to be executed after a certain event has happened? (What is a callback?)
  * What is the difference between an AJAX request and a normal request? (When is an HTTP request processed by a callback function instead of the browser refreshing and processing a response?)
  * What is the common abbreviation for Asynchronous JavaScript and XML? (What does AJAX stand for?)
* Security
  * Which Application layer protocol encrypts every request/response before it is transported over the network? (What is the difference between HTTP and HTTPS?)
  * What cryptographic protocol does HTTPS use for encryption? (What is the Transport Layer Security protocol (TLS)?)
  * Under what policy does a web browser permit scripts contained in a webpage to access data in a second webpage if they share the same origin (scheme, hostname and port)? (What is the same-origin policy?)
  * What do we call the mechanism that allows interactions that would normally be restricted cross-origin to take place? (What is cross-origin resource sharing (CORS)?)
  * What process adds new HTTP headers, allowing servers to share resources cross-origin to certain specified origins? (How does CORS (cross-origin resource sharing) work?)
  * What do we call the exploitation of a valid computer session (session id) to gain unauthorized access to information or services in a computer system? (What is session hijacking?)
  * What security issue do we solve by setting an expiration time on sessions? (How does setting an expiration time solve the session hijacking issue?)
  * What are the three main countermeasures for session hijacking? (What problem can we attempt to solve by requiring session resets, setting session expiration times, and/or using HTTPS across the entire app?)
  * What do we call the type of attack where users are allowed to input (inject) HTML or JavaScript that ends up being displayed by the site directly? (What is cross-site scripting (XSS)?)
  * Why is it best practice to sanitize the HTML inputs in an app? (How can we account for the possibility of a cross-site scripting (XSS) attack?)
* General
  * What type of client is responsible for issuing HTTP requests and processing the response in a user-friendly manner onto your screen? (What is a web browser?)
  * What do we call a machine that handles inbound requests and issues responses? (What is a server?)
  * What is the generic term for things you interact with on the internet via a URL-- files, web pages, software, etc? (What is a resource?)
  * What do we call a device that responds to requests for static assets on the internet: files, images, CSS, Javascript, etc? (What is a web server?)
  * What do we call a server where application or business logic resides and where more complex requests are handled (where your server-side code lives when deployed)? (What is an application server?)
  * What is the difference between referring to HTTP and http? (How do we refer to HTTP differently as a URL scheme vs. a protocol?)
* Images
  * ![Internet](https://d186loudes4jlv.cloudfront.net/http/images/internet.png)
  * ![Client Server](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/client-sever.png)
  * ![Zoomed in Server](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/server-zoom-web-app-data.png)
  * ![HTTP over TCP/IP](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/http-zoom-tcpip.png)