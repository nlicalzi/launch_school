## RB170 Lesson 2: The Transport Layer

### Overview:

1. What to Focus On
   * Learn how transport layer protocols enable communication between processes
     * Build a mental model for what **multiplexing** and **demultiplexing** are.
     * Be clear about how **ports** work, along with **IP addresses**, to provide this functionality.
   * Learn that **network reliability** is engineered
   * Understand the trade-offs
     * What do **TCP** and **UDP** each provide, and what are the trade-offs of each?
2. Communication Between Processes
3. Network Reliability
4. Transmission Control Protocol (TCP)
5. User Datagram Protocol (UDP)



### Summary:



### Vocab:

* **Socket**: the combination of IP address and port number, ex. `216.3.128.12:8080` (`ipv4:port`)

### Notes:

* Communication Between Processes
  * The internet can be considered a *layered system* of communication, with each layer providing a certain level of functionality or service to the layer above.
  * The Internet Protocol (IP) essentially provices the inter-network communication services that enable a *minimum viable internet*.
  * Modern networked applications require two main things beyond what the IP provides: *a direct connection between applications* and *reliable network communication*.
  * If the Internet Protocol enables communication between *hosts*, how do we expand upon it to enable communication between different *applications* on those hosts?
  * **Multiplexing** (**muxing**) is the process and technique of transmitting multiple analog or digital signals over a single channel. It is performed by a hardware component called a **multiplexer**.
  * **Demultiplexing** (**demuxing**) is the process of reconverting a signal containing multiple analog or digital signal streams back into the original separate and unrelated signals.
  * Is **demuxing** the opposite of **muxing**?
    * No! The opposite of multiplexing is **inverse multiplexing** (**iMuxing**). Demuxing converts a single stream into unrelated output streams, while the output streams of iMuxing are related.
  * Multiplexing is a general concept, accomplished in the **Transport layer** of our network communication model through the use of **network ports**.
  * A **port** is an identifier for a specific process running on a host. Ports consist of an integer in the range 0-65535 (16 bits).
    * 0-1023 are *well known* ports, assigned to processes providing common network services
      * HTTP is port 80, FTP is port 20 and 21, SMTP is port 25, etc.
    * 1024-49151 are *registered* ports (assigned to companies like Cisco/IBM/Microsoft)
    * 49152-65535 are *dynamic* ports (sometimes *known* as private ports)-- can be allocated as *ephemeral* ports.
  * *Source* and *destination* ports are included in the Protocol Data Unit (PDU) for the Transport layer.
    * Data from the Application layer is the data payload for the Transport layer PDU.
    * The entire Transport layer PDU then becomes the payload for an IP Packet.
  * The combination of an IP Address and the port number constitute a *communication end-point* or a **socket** and enable end to end communication between specific applications on different machines!
  * The `netstat` utility returns a list of active network connections, with Local/Foreign Address columns displaying the sockets/communication endpoint addresses.
  * Sockets can mean different things, depending on context!
    * UNIX socket: a mechanism for inter-process communication between local processes running on the same machine.
    * Internet sockets (like a TCP/IP socket): a mechanism for inter-process communication between networked processes (usually on different machines).
    * Ruby, Python, and Node.js (among others) all have implementations of *socket objects*, following the Berkley sockets API model.
  * Difference between *connection-oriented communication* and *connectionless communication* is an important factor in understanding the differences between the TCP and UDP protocols.
    * A connectionless system could have one socket object calling a `listen()` method on a specific port, processing incoming messages as they arrive and responding as necessary.
    * Instantiating multiple socket objects allows for the implementation of connection-oriented network communication between applications-- a dedicated virtual connection for communication btw. a specific process on one host and a specific process on another.
* Network Reliability
  * The levels of the network, up to and including the Internet Protocol is effectively an *unreliable communication channel* because of the possibility of losing data and it not being replaced-- we know that Ethernet and the IP include checksum data as part of their head or trailer and the frames/packets are simply dropped if corrupted.
  * What are the fundamental elements required for reliable data transfer?
    * In order delivery: data is received in the order that it was sent.
    * Error detection: corrupt data is identified using a checksum.
    * Handling data loss: missing data is retransmitted based on acknowledgements and timeouts.
    * Handling duplication: duplicate data is eliminated through the use of sequence numbers.
  * A Stop-and-Wait protocol is one in which each message is sent one at a time, and an acknowledgement is received before the next message is sent. Too much time is spent *wait*ing for an acknowledgement-- inefficient use of bandwith.
    * This issue is solved through *pipelining*-- the sender implements a 'window' representing the max. number of messages in the pipeline at any time, and moves the window as it receives the appropriate acknowledgements for the messages in the window. Efficient use of available bandwidth!
* Transmission Control Protocol (TCP)
  * A major part of the implementation of TCP is finding a balance between reliability and performance.
  * TCP, essentially, provides the abstraction of reliable network communication on top of an unreliable channel-- hiding much of the complexity of reliable network communication from the application layer: *data integrity*, *de-duplication*, *in-order delivery*, and *retransmission of lost data*.
  * TCP comes with performance challenges because of its complexity, despite it being hidden by abstraction from developers at the application level. It tries to compensate by providing mechanisms for *flow control* and *congestion avoidance*.
  * **TCP Segments** are the Protocol Data Unit of TCP-- consisting of headers (incl. Source Port, Destination Port, Checksum, Sequence Number, Acknowledgement Number, Window Size, Flags, etc.) and payloads (e.g. HTTP Request).
    * Checksum: provides the *Error Detection* aspect of TCP reliability.
    * Sequence & Acknowledgement Number: provide the In-order Delivery, Handling Data Loss, and Handling Duplication aspects of TCP reliability.
  * TCP is a *connection-oriented protocol*, only sending application data once a connection has been established between application processes.
    * TCP uses a "*three-way handshake*" to establish a connection, and a "*four-way handshake*" for terminating connections.
    * Three-way handshake: Sender sends `SYN`, receiver responds with `SYN ACK`, sender responds with `ACK`, and connection is then established. (`SYN`: 'synchronize'. `ACK`: 'acknowledge')
      * There is an entire round-trip of latency before any application data can be exchanged!
    * ![Screen Shot 2020-05-24 at 4.44.45 PM](/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-05-24 at 4.44.45 PM.png)
    * ![Diagram of three-way TCP handshake, with data being sent after the ACK](https://da77jsbdz4r05.cloudfront.net/images/ls170/transport-tcp-thre-way-handshake-data-delay.png)
  * TCP involves a lot of overhead in terms of establishing connections, and providing reliability through the retransmission of lost data. In order to facilitate efficient data transfer once a connection is established, TCP provides mechanisms for **flow control** and **congestion avoidance**.
    * **Flow control** is a mechanism to prevent the sender from overwhelming the receiver with data.
      * Data awaiting processing is stored in a *buffer*, the size of which depends on the amount of memory allocated by the OS configuration and physical resources available.
      * Each side lets the other know the amount of data that it is willing to accept through the `WINDOW` field of the TCP header-- the number is dynamic and can change during connection.
    * **Congestion avoidance** is a mechanism to prevent the sender or receiver from overwhelming the underlying network with data.
      * It's like traffic gridlock, but instead of a standstill the 'excess vehicles' are just lost for good.
      * At each hop for an IP Packet, the packet has to be processed by a router (run a checksum, check destination address, route the packet)-- the processing takes time, and other packets are stored in a buffer while waiting their turn. If the buffer over-flows those packets are dropped.
      * TCP uses data loss as a feedback mechanism-- if lots of retransmissions are occurring, TCP knows the network is congested and reduces the transmission `WINDOW SIZE`.
  * What are the drawbacks of using TCP? 
    * Latency overhead in establishing a TCP connection due to the handshake process.
    * Head-of-Line (HOL) blocking: issues in delivering/processing one message in a sequence of messages can delay or 'block' the delivery/processing of subsequent messages.
      * Occurs in TCP because of the In-Order Delivery of segments-- results in Queueing Delay (one of the elements of Latency.)
* User Datagram Protocol (UDP)
  * If TCP implements reliable data transfer through sequencing and retransmission, flow control, and congestion avoidance, what does UDP implement them? It *doesn't*!
  * The Protocol Data Unit (PDU) of UDP is a **Datagram**-- its header consists of a Source and Destination Port, the length in bits of the Datagram and its encapsulatied data, and a Checksum field.
    * Datagrams provide multiplexing in the same way that TCP Segments do (port info).
    * UDP provides no guarantee of message delivery.
    * UDP provides no guarantee of message delivery order.
    * UDP provides no built-in congestion avoidance or flow-control mechanisms.
    * UDP provides no connection state tracking, since it is a *connectionless protocol*.
  * What advantages does UDP have over TCP? Its simplicity, providing *speed* and *flexibility*.
    * UDP is a connectionless protocol-- no need to wait for a connection to be established.
    * No acknowledgements/retransmissions makes data delivery faster, latency is less of an issue.
    * Lack of In-Order delivery removes the issue of Head-of-Line blocking.
  * UDP is effectively a 'base template'-- engineers building at the application level can pick and choose to implement any/all of the services that UDP doesn't natively provide.
  * Think of a voice or video calling application-- a slightly glitchy call or few pixels of video dropping out is ok if the speed is otherwise as close as possible to real-time. Same for online gaming-- want to reduce lag at all costs? Go with UDP!