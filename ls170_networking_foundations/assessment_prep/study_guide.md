## Study Guide for LS171 Assessment



### The Internet

* Have a broad understanding of what the internet is and how it works
  * What is the internet? How does it work?
    * The internet is a network of networks, made up of interconnected computers and devices that communicate and exchange data.
    * Two important conceptual components of the internet are the physical infrastructure of the network, as well as the network protocols that enable legible communication.
      * The physical network is [...]
      * By using network protocols (specifically the Internet Protocol Suite or TCP/IP), we ensure that the individual links in the network are transmitting data in a structured way such that the recipients of that transmission are able to process and respond to the messages that they receive. This is an important component of a functioning internet because of the vast array of devices and software in existence-- how can we enable successful and productive communication between an iPhone and a smart television, for example? The answer lies in creating a framework/set of rules for predictible, structured messaging, and that's what protocols offer us. 
* Understand the characteristics of the physical network, such as latency and bandwidth
  * What is latency? What strategies can we employ to minimize its impact?
    * Latency is a measure of delay, measuring how long it takes for data to travel from point to point (in the case of the internet, generally from the client to the server and back again). 
    * Latency is a particular issue with the TCP Transport protocol, since it involves a certain amount of latency in establishing a connection through the TCP Handshake process as well as its requirement for in-order delivery of data (which causes Head-of-Line blocking and queueing delay).
    * If our goal is to reduce latency at the cost of data integrity/fidelity, we can use the UDP protocol instead which focuses on speed through simplicity, without requiring a connection to start sending data or providing guarantees of message delivery and message order.
  * What is bandwidth? How can we "boost" our bandwidth without changing the physical network?
    * Bandwidth is a measure of capacity, measuring the amount of data that can be transmitted in a set period of time. 
    * We can "increase" our bandwidth (or, more accurately: increase our usage efficiency of available bandwidth) by using multiplexing (and demultiplexing), which refers to the process and technique of transmitting multiple signals over a single channel. Multiplexing capacity is implemented at the Transport layer of the Internet Protocol suite, and both TCP and UDP implement this capability through the use of network ports: source and destination ports for the message are specified in the header of the Transport layer Protocol Data Unit.
* Have a basic understanding of how lower level protocols operate
  * What is a protocol? What is a network protocol?
    * A protocol is a set of rules and standards, and in terms of computer networking, a network protocol refers to a set of rules that govern how different devices on a network exchange data.
    * Network protocols are useful because they allow the vast range of devices (and the even more vast range of software) out there in the world to successfully and legibly interact. How can we ensure that your smart lightbulb is able to switch colors as you press buttons on your phone? By ensuring that the data transmission between the two devices is specifically formatted in such a way that the programs running on both devices are able to read and respond to individual messages.
  * What are the four main protocol layers in TCP/IP? From highest to lowest?
    * The four main protocol layers in TCP/IP (from highest to lowest) are: Application, Transport, Internet, and Link. The Protocol Data Unit from each layer, starting at the Application layer, is encapsulated into the PDU from the layer below as a data payload, with protocol-specific metadata making up a header/trailer.
  * What is each protocol layer responsible for?
    * Application: Responsible for creating and transmitting user data between applications that can be on remote systems but should appear to operate as if locally to the end user.
    * Transport: Responsible for communication between processes, utilizing ports to address different services. Capable of reliable or unreliable connections, depending on the type of protocol used.
    * Internet: Used to transport data from node to node in a network-- the layer is aware of the endpoints of the connections, but does not worry about the actual connection needed to get from one place to another. IP addresses defined in this layer are a way of reaching remote systems in an addressable manner.
    * Link: Establishes connections between neighboring nodes to send data-- allowing the internet layer to present an addressable interface.
* Know what an IP address is and what a port number is
  * What is an IP Address?
    * An IP Address is a unique, dynamic address that is assigned to a device as it joins a network, allowing for it to be locatable on that network. IP Addresses are implemented by way of assignment in the header of an Internet layer PDU (IP Packet).
  * What is the difference between an IP Address and a MAC Address?
    * While MAC Addresses are "burned-in" to the device when it is manufactured, IP Addresses are dynamic and can shift depending on the network to which a device is connected.
  * What is a port number?
    * A port is an address on a specific device that acts as an identifier for a process. The combination of an IP Address and a port constitutes a socket, which allows for end to end communication between specific applications on different machines.

* Have an understanding of how DNS works

  * What is DNS?
    * DNS (Domain Name System) is a distributed database that maps domain names to IP Addresses, allowing for humans to remember and utilize more easily remembered domain names instead of IP Addresses consisting of long sequences of integers.
  * How does DNS work?
    * It is conceptually helpful to think of DNS as acting like a phonebook for the internet-- DNS translates domain names into IP Addresses, so that devices can load resources from the internet without necessarily requiring the memorization of long sequences of integers (for IPv4 addresses) or hex digits (for IPv6 addresses).

* Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model

  * What is the client-server model of web interactions?

    * Clients communicate with datastores located on servers (think of this in contrast with P2P, or node-node, for ex.)

  * What is the role of HTTP as a protocol within that model?

    * In the Client-Server model of web interactions using HTTP, a Request is made to a *server* by a *client*, and the *server* then sends a Response back to the *client*.

      

### TCP & UDP

* Have a clear understanding of the TCP and UDP protocols, their similarities, and their differences
  * What is the TCP protocol?
  * What is the UDP protocol?
    * User Datagram Protocol
    * Connectionless and doesn't guarantee many of the things that TCP does.
    * Simple, offering speed and flexibility
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
    * {scheme}://{hostname}{optional port (HTTPS GET default is 80)}{path}{query string}
  * What does each component represent?
    * What is a scheme, in the context of a URL?
    * What is a hostname, in the context of a URL?
    * What is a port, in the context of a URL?
    * What is a path, in the context of a URL?
    * What is a query string, in the context of a URL?
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