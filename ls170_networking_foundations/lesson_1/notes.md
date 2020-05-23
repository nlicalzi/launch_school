## RB170 Lesson 1: The Internet

### Overview:

* What to Focus On
  * Build a general picture of the network infrastructure
  * Be aware of the limitations of the physical network
  * Understand that protocols are systems of rules
  * Learn that IP enables communication between devices
* What is the Internet?
* Protocols
* A Layered System
* The Physical Network
* The Link/Data Link Layer
* The Internet/Network Layer



### Notes

* **What is the internet?**
  * What is a Network?
    * Two (or more) devices connected in such a way that they can communicate or exchange data.
  * Local Area Network (LAN)
    * Multiple computers and other devices connected via a network bridging device such as a hub, or a switch. Computers are connected to this device via network cables, forming the network.
    * Your home network follows same principal, but centers on a wireless hub or switch (WLAN)
  * Inter-Network communication
    * Routers are network devices that can route network traffic to other networks. Within a LAN, they act as gateways into and out of the network.
  * A Network of Networks
    * The internet is a vast number of such networks connected together, with systems of routers in between all of the sub-networks.
* **Protocols**
  * How can we ensure that disparate components, using a massive variety of software, are able to connect and successfully and intelligibly transfer information?
    * By using **protocols**.
  * What is a protocol, in terms of computer networks?
    * A set of rules governing the exchange or transmission of data.
  * Protocols for Different Aspects of Communication // Different Protocols for the Same Aspect of Communication
* **A Layered System**
  * What is the OSI model?
    * A conceptual model that characterises and standardises the communication functions of a computing system, without regard to its underlying internal structure and technology. It divides its layers in terms of the function that each layer provides.
    * Organized into seven abstraction layers (from lowest to highest):
      * Physical -> Data Link -> Network -> Transport -> Session -> Presentation -> Application
  * What is the Internet Protocol Suite (aka the TCP/IP model)?
    * The conceptual model and set of communications protocols used in the Internet.
    * It specifies how data should be packetized, addressed, transmitted, routed, and received, dividing its layers in terms of the scope of communications within each layer.
    * Organized into four abstraction layers (from lowest to highest):
      * Link -> Internet -> Transport -> Application
  * How do the OSI and TCP/IP models relate to each other?
    * ![Diagram comparing OSI model layers with TCP/IP layers](https://da77jsbdz4r05.cloudfront.net/images/ls170/layered-system-osi-tcp-ip-comparison.png)
  * What does TCP/IP stand for?
    * Transmission Control Protocol / Internet Protocol
  * How does data encapsulation apply to network communication models?
    * We hide the data from one layer by encapsulating it within a data unit of the layer below.
  * What is a **Protocol Data Unit**?
    * A **Protocol Data Unit** (PDU) is an amount or block of data transferred over a network.
    * PDUs are known by different names in different protocols/protocol layers-- a frame, packet, segment, datagram, etc.
    * Basic concept is the same: a PDU consists of a **header**, a data **payload**, and sometimes a **footer**.
    * The purpose of a header/tailer is to provide protocol-specific metadata about the PDU.
    * The payload is the data we want to transport over the network-- the entire PDU from a protocol at one layer is set as the payload for a protocol at the layer below:
      * ![Diagram demonstrating concept of encapsulation i the context of PDUs at different network layers ](https://da77jsbdz4r05.cloudfront.net/images/ls170/layered-system-encapsulation.png)
    * A protocol at one layer doesn't need to know anything about how a protocol at another layer is implemented in order for those protocols to interact-- remember encapsulation/abstraction? A lower layer effectively provides a *service* to the layer above it.
* **The Physical Network**
  * The bottommost layer of the OSI model is the Physical layer-- the functionality at this level is essentially the transfer of bits, which are converted and transmitted either by electrical, light, or radio signals.
  * What are the two main characteristics in terms of the performance of a physical network? 
    * **Latency**, or the amount of time it takes for data to go from point to point in a network
    * **Bandwith**, or the amount of data that can be sent at once. The bandwidth that a connection receives is the lowest amount at a particular point in the overall connection (bandwith bottleneck).
  * What are the various elements of types of delay that are combined to determine overall latency?
    * **Propagation delay**: amount of time it takes for a message to travel from sender to receiver
    * **Transmission delay**: amount of time it takes to push data onto each link in the system
    * **Processing delay**: amount of time each link takes to process the data
    * **Queueing delay**: amount of time spent *buffering* (waiting in the processing queue), as routers can only process a certain amount of data at one time
  * What is **last mile latency**?
    * The delays involved in getting the network signal from your ISP's network to your home or office network-- the entry point into a network.
  * What is **Round-trip Time (RTT)** in the context of latency?
    * The length of time for a signal to be sent, plus the time for an acknowledgement or a response to be received.
  * What utility can we use to display the route and latency of a path across a network?
    * `traceroute`-- for documentation use `man traceroute`
  * 