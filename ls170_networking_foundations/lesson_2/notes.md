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
* User Datagram Protocol (UDP)