## LS 170 Lesson 2: Intro to HTTP



### Overview:

1. What to Focus On
   * Develop a clear understanding of the role of HTTP
     * How does the web function as a combination of multiple different technologies?
     * What is the specific role that HTTP plays in this?
   * Break things down into individual components
     * Ensure clarity in mental models: break HTTP, URLs, etc. into components and purposes
2. The Application Layer
3. HTTP and the Web
4. Assignment: Read HTTP Book
5. Some Background and Diagrams
6. URLs
7. Practice Problems: URL Components
8. The Request Response Cycle



### Summary



### Notes

* The Application Layer
  * The topmost protocol layer in both the TCP/IP and OSI models is the Application layer
  * The Application layer does not refer to the application itself, but protocols that provide services to it
  * Though the Application layer provides the protocols with which the application most directly interacts, applications also interact with Transport protocols-- opening a TCP socket, for example
  * Application layer protocols rely on lower layer protocols to ensure that messages get to where they are supposed to go, focusing instead on the structure of the message and the data it contains
  * Application layer protocols: the "rules for how applications talk to each other at a syntactical level"
  * Different applications have different requirements for how to communicate at a syntactical level, and so there are many different Application layer protocols: FTP, SMTP, **HTTP**, etc.
* HTTP and the Web
  * HTTP is the primary protocol used for communication on the Web
  * The ***internet*** is a network of networks-- can be thought of as the infrastructure that enables inter-network communication, both in terms of the physical network and the lower-level protocols that control its use.
  * The World Wide Web (***web***) is a **service** that can be accessed via the internet-- it is a vast information system comprised of resources which are navigable by means of a URL.
  * Tim Berners-Lee and Robert Cailliau proposed the Web as a way to create an easily accessible information system at CERN, spanning various internal computers and networks.
  * Uniformity was provided in the earliest incarnation of the web through a combination of three technologies/concepts: **HTML**, **URI**s, and **HTTP**.
    * HTML provided uniformity in the way resources were structured so they could all be correctly rendered for viewing (anchor elements `<A>` used `href` attributes to provide links between resources).
    * URIs provided uniformity in the way resources were addressed so they could be simply and easily located.
    * HTTP provided uniformity in the way a request for a particular resource was made and the way in which that request was responded to.
  * **HTTP** is the primary means by which applications interact with the resources which make up the web.
  * A Uniform Resource Identifiers (**URI**) is a string of characters that identifies a particular resource, part of a system by which resources can be uniformly **addressed** on the web.
  * **Hypertext** is text displayed on a computer display with references (**hyperlinks**) to other text that the reader can immediately access.
  * **Hypertext Transfer Protocol (HTTP)** is the set of rules which provide uniformity to the way resources on the web are transferred between applications.
* HTTP Book (**refer to ~/launch_school/open_book_shelf/HTTP/**)
* Some Background and Diagrams
  * Note: make multiple flashcards per diagram
  * ![Client Server](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/client-sever.png)
    * First question: client and server, second question: http request and response
  * ![Zoomed in Server](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/server-zoom-web-app-data.png)
    * First question: black out Web Server, Application Server, Data Store
  * What do we call a server that responds to requests for static assets: files, images, css, javascript, etc? (What is a web server?)
  * What do we call a server where application or business logic resides and more complex requests are handled (e.g. where your server-side code lives when deployed) ?(What is an application server?)
  * What do we call the place where we can retrieve or create data (like a file, key/value store, relational database, etc)? (What is a data store?)
  * ![HTTP over TCP/IP](https://da77jsbdz4r05.cloudfront.net/images/handling_requests_manually/http-zoom-tcpip.png)
    * What kind of connection? What kind of HTTP Request Method?
* URLs
  * What do we call the subset of URIs that, in addition to identifying a resource, provide a means of locating the resource by describing its primary access mechanism (e.g. its network 'location')? (What is a Uniform Resource Locator (URL)?)
  * What is the difference between `http` and `HTTP`? (How do we refer to HTTP differently when we're talking about it in a URL scheme vs. as a protocol?)
* URL Components
  * Given the following URL, identify the **host**, the names of the **query parameters**, the values of the **query parameters**, the **scheme**, the **path**, and the **port**:
    * `https://amazon.com/Double-Stainless-Commercial-Refrigerator/B60HON32?ie=UTF8&qid=142952676&sr=93&keywords=commercial+fridge`
    * Host: `amazon.com`
    * Query Parameter Names: `ie`, `qid`, `sr`, `keywords`
    * Query Parameter Values: `UTF8`, `142952676`, `93`, `commercial+fridge`
    * Scheme: `https`
    * Path: `/Double-Stainless-Commercial-Refrigerator/B60HON32`
    * Port: Not specified-- `https` generally uses 443 (`http`: 80), but that's not in the URL
  * Add the port `3000` to the following URL:
    * `http://amazon.com:3000/products/B60HON32?qid=142952676&sr=93`
  * Given the following URL, identify the **query parameters**, the **scheme**, the **path**, the **host**, and the **port**: 
    * `http://localhost:4567/todos/15`
    * Query parameters: none
    * Scheme: `http`
    * Path: `/todos/15`
    * Host: `localhost`
    * Port: `4567`
  * What are two different ways to encode a space in a query parameter? (What do the following represent: `%20` and `+`?)
  * What character indicates the beginning of a URL's query parameters? (What does a `?` represent in a URL?)
  * What character is used between the name and value of a query parameter? (What does a `=` represent in a URL?)
  * What character is used between multiple query parameters? (What does a `&` represent in a URL?)
* The Request Response Cycle
  * What are the required components of an HTTP request? What are the additional optional components?
    * Required: `Method`, `Host` `Header`, and `Path` (request-URI)
    * Optional: `Parameters`, other `Headers`, and `Body`
  * What are the required components of an HTTP response? What are the additional optional components?
    * Required: `Status`
    * Optional: `Headers` and `Body` payload
  * What determines whether a request should use `GET` or `POST` as its HTTP method?
    * `GET` requests or fetches data from the server
    * `POST` pushes data back to the server from the client, adding or changing values