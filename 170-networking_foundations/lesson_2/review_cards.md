## LS170 Lesson 2: The Transport Layer

### Focus:

* Learn how Transport layer protocols enable communication between processes
  * Build a clear mental model for what **multiplexing** and **demultiplexing** are
  * Be clear about how **ports** work, along with **IP addresses**, to provide this functionality.
* Learn that **network reliability** is engineered
* Understand the trade-offs
  * What do **TCP** and **UDP** each provide, and what are the benefits/weaknesses of each?



### Cards:

* What is a port?
  * What do we call a communication endpoint or an identifier for a specific process running on a host, consisting of a 16 bit integer? (0-65,535)
* What is a *well-known* port?
  * What do we call the ports from 0 to 1023, which are assigned to processes providing common network services like HTTP, FTP, SMTP, etc?
* What are *registered* ports?
  * What do we call the ports from 1,024 to 49,151 that are assigned to companies like Cisco/IBM/Microsoft for specific purposes?
* What are *dynamic* ports?
  * What do we call the ports from 49,152 to 65,535 that can be allocated as *ephemeral* ports as needed?
* What is an *ephemeral* port?
  * What do we call a temporary transport protocol port for IP communications? 
* How do network ports enable multiplexing?
  * What is enabled by TCP and UDP including source port and destination port number fields in their segment headers?
* What is a network socket?
  * What do we call an internal endpoint for sending or receiving data on a computer network, represented by an IP Address and port number, in the form `216.3.128.12:8080 // IPv4:port`
* How does TCP use socket objects?
  * What Transport protocol instantiates multiple socket objects that can allow for connection-oriented network communication between applications?
* How does UDP use socket objects?
  * What Transport protocol might instantiate a single socket object that calls a `listen()` method on a specific port, processing incoming messages as they arrive and responding as necessary?
* What is the fundamental difference between TCP and UDP?
  * Which Transport protocol represents *connection-oriented* communication and which represents *connectionless* communication?
* What are the fundamental elements required for reliable data transfer?
  * In-order delivery, data integrity, retransmission of lost data, and handling duplication.
* What is a Stop and Wait protocol?
  * What do we call a protocol where one message is sent at a time, and an acknowledgement must be received before the next message is sent (representing an inefficient use of bandwidth)?
* What is pipelining? Why does it enable the efficient use of bandwidth?
  * What is it called when a sender implements a 'window' that represents the maximum number of messages in a queue at a time, moving the window as it receives the appropriate acknowledgements for the messages in the window?
* What is the core principal of the Transmission Control Protocol (TCP)?
  * Which Transport protocol is focused on finding a balance between reliability and performance?
* How does TCP try to compensate for its complexity-based performance challenges?
  * Why does TCP provide mechanisms for Flow Control and Congestion Avoidance?
* What is the PDU of TCP?
  * What is a TCP Segment?
* What part of the TCP Segment header accomplishes the Error Detection aspect of TCP reliability?
  * What do TCP Segments accomplish by including a Checksum in their header?
* What parts of the TCP Segment header provide for the Data Integrity, Handling Duplication, and Retransmission of Lost Data components of TCP reliability?
  * What do TCP segments accomplish by including Sequence Numbers and Acknowledgement Numbers?
* What makes TCP a connection oriented protocol?
  * Why does TCP only send application data once a connection has been established between application processes?
* How does TCP establish a connection between processes?
  * What is a "three-way handshake"?
* What steps occur in a TCP "three-way handshake"?
  * In what context will a sender send `SYN` (synchronize), a receiver respond with `SYN ACK`, and a sender respond with `ACK`?
* What is the effect of TCP requiring a "three-way handshake" on its speed?
  * What is a major component of why TCP is slower than UDP?
* Why does TCP use Flow Control?
  * How does TCP implement a mechanism to prevent the sender from overwhelming the receiver with data?
* How does TCP provide Flow Control?
  * Why does TCP store data awaiting processing in a buffer and include a `WINDOW SIZE` in its header?
* Why does TCP use Congestion Avoidance?
  * How does TCP implement a mechanism to prevent the sender or receiver from overwhelming the underlying network with data?
* How does TCP provide Congestion Avoidance?
  * Why does TCP use data loss as a feedback mechanism, reducing the `WINDOW SIZE` in its header if lots of retransmissions are occurring?
* Why do we say TCP suffers from Head-of-Line Blocking?
  * What is one effect of TCP's In-Order Delivery of segments resulting in Queueing Delay?
* What is the core principal of the User Datagram Protocol (UDP)?
  * Which Transport protocol is focused on providing speed and flexibility through its simplicity?
* What is the PDU of UDP?
  * What is a UDP Datagram?
* What does UDP provide? What does it (notably) not provide, compared to TCP?
  * Which Transport protocol provides multiplexing through the sharing of port info, but does not provide guarantee of message delivery, delivery order, congestion avoidance, flow control, or connection state tracking?
* What are some examples of applications that benefit from using UDP over TCP?
  * What Transport protocol might a video-game or video-conferencing software prefer to use, where speed is a priority over 100% accuracy?
* What are some examples of applications that would benefit from using TCP over UDP?
  * What Transport protocol might an email or banking software prefer to use, where 100% accuracy is a priority over speed?