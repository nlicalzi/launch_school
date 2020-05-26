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
  * **URL** stands for Uniform Resource Locator.
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
* URLs
* URL Components
* The Request Response Cycle