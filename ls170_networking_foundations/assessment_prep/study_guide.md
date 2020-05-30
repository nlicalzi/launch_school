## Study Guide for LS171 Assessment



### The Internet

* Have a broad understanding of what the internet is and how it works
  * What is the internet? How does it work?
* Understand the characteristics of the physical network, such as latency and bandwidth
  * What is latency? What strategies can we employ to minimize its impact?
  * What is bandwidth? How can we "boost" our bandwidth without changing the physical network?
* Have a basic understanding of how lower level protocols operate
  * What are the four main protocol layers in TCP/IP? From highest to lowest?
  * What is each protocol layer responsible for?
    * Application: Responsible for creating and transmitting user data between applications that can be on remote systems but should appear to operate as if locally to the end user.
    * Transport: Responsible for communication between processes, utilizing ports to address different services. Capable of reliable or unreliable connections, depending on the type of protocol used.
    * Internet: Used to transport data from node to node in a network-- the layer is aware of the endpoints of the connections, but does not worry about the actual connection needed to get from one place to another. IP addresses defined in this layer are a way of reaching remote systems in an addressable manner.
    * Link: Establishes connections between neighboring nodes to send data-- allowing the internet layer to present an addressable interface.
* Know what an IP address is and what a port number is
  * What is an IP Address?
  * What is a port number?

* Have an understanding of how DNS works
  * What is DNS?
  * How does DNS work?
* Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model
  * What is the client-server model of web interactions?
  * What is the role of HTTP as a protocol within that model?

### TCP & UDP

* Have a clear understanding of the TCP and UDP protocols, their similarities, and their differences
  * What is the TCP protocol?
  * What is the UDP protocol?
  * How are TCP and UDP similar? How are they different?
* Have a broad understanding of the three-way handshake and its purpose
  * What is the three-way handshake?
  * Why does TCP implement a three-way handshake?
* Have a broad understanding of flow control and congestion avoidance
  * How is flow control implemented in the Transport layer of the Internet Protocol?
  * How is congestion avoidance implemented in the Transport layer of the Internet Protocol?

### URLs

* Be able to identify the components of a URL, including query strings
  * Name the various components of a URL.
  * What does each component represent?
* Be able to construct a valid URL
* Have an understanding of what URL encoding is and when it might be used
  * What is URL encoding?
  * When do we use URL encoding?

### HTTP and the Request/Response Cycle

* Be able to explain what HTTP requests and responses are, and identify the components of each
  * What is an HTTP request? What is an HTTP response?
  * What are the essential components of an HTTP request?
  * What are the essential components of an HTTP response?
* Be able to describe the HTTP request/response cycle
  * What are the steps in an HTTP request/response cycle?
* Be able to explain what status codes are, and provide examples of different status code types
  * What is an HTTP status code?
  * What are the most common HTTP status codes?
* Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state
  * What is statefulness in the context of the web? What is statelessness?
  * How can we simulate state in the web?
* Explain the difference between `GET` and `POST`, and know when to choose each
  * What are the two most common HTTP Request methods?
  * What is the difference between `HTTP GET` and `HTTP POST`?

### Security

* Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks
  * What are some of the security risks presented when working with HTTP?
* Be aware of the different services that TLS can provide, and have a broad understanding of each of those services
  * What is TLS?
  * What are the services provided by TLS? When do we use them?