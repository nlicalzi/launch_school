## LS 170 Lesson 2: Intro to HTTP



### Overview:

1. What to Focus On
   * Develop a clear understanding of the role of HTTP
     * How does the web function as a combination of multiple different technologies?
     * What is the specific role that HTTP pleays in this?
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
* HTTP Book
* Some Background and Diagrams
* URLs
* URL Components
* The Request Response Cycle