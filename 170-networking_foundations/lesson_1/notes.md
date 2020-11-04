## LS170 Lesson 1: The Internet

### Overview:

* What to Focus On
  * Build a general picture of the network infrastructure
    * Build the general mental models that will provide sufficient context to understand protocols operating at higher levels of abstraction, such as TCP and HTTP
  * Be aware of the limitations of the physical network
    * TCP and HTTP are bound by limitations of physical infrastructure: latency and bandwidth
  * Understand that protocols are systems of rules
  * Learn that IP enables communication between devices
    * Form a clear mental model of the Internet Protocol
* What is the Internet?
* Protocols
* A Layered System
* The Physical Network
* The Link/Data Link Layer
* The Internet/Network Layer



### Summary:

* The internet is a vast *network of networks*. It is comprised of both the **network infrastructure** itself (devices, routers, switches, cables, etc.) and the **protocols** that enable that infrastructure to function.
* **Protocols** are *systems of rules*. Network protocols are systems of rules governing the exchange or transmission of data over a network.
* Different types of protocol are concerned with different aspects of network communication. It can be useful to think of these different protocols as operating at particular '*layers*' of the network.
* Encapsulation is a means by which protocols at different network layers can work together.
* Encapsulation is implemented through the use of **Protocol Data Units** (PDUs). The PDU of a protocol at one layer becomes the data payload of the PDU of a protocol at a lower layer.
* The physical network is the tangible infrastructure that transmits the electrical signals, light, and radio waves which carry network communications.
* **Latency** is a measure of *delay*. It indicates the amount of time it takes for data to travel from one point to another.
* **Bandwidth** is a measure of *capacity*. It indicates the amount of data that can be transmitted in a set period of time.
* **Ethernet** is a set of standards and protocols that enables communication between devices on a local network.
* Ethernet uses a Protocol Data Unit called a **Frame**.
* Ethernet uses **MAC addressing** to identify devices connected to the local network.
* The **Internet Protocol** (IP) is the predominant protocol used at this layer for *inter-network communication*.
* There are two versions of IP currently in use: IPv4 and IPv6.
* The *Internet Protocol* uses a system of addressing (IP Addressing) to *direct data between one device and another across networks*.
* IP uses a Protocol Data Unit called a **Packet**.



### Vocab:

* **Network infrastruture**
* **Protocols**
* **Protocol Data Units**
* **Latency**
* **Bandwidth**
* **Ethernet**
* **Ethernet Frame**
* **MAC Address**
* **Internet Protocol**
* **IP Addressing**
* **IPv4**
* **IPv6**
* **Packet**



### Notes:

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
* **The Link/Data Link Layer**
  * The protocols operating at this layer are primarily concerned with the identification of devices on the physical network and moving data over the physical network between the devices that comprise it (like host computers, switches, and routers). (Keys: **FRAMES** and **ADDRESSING**)
  * The most commonly used protocol at this layer is the **Ethernet** protocol.
    * **Ethernet Frames** are a Protocol Data Unit (PDU) that encapsulate data from the Internet/Network layer above. The Link/Data Link layer is the lowest layer at which encapsulation takes place. At the Physical layer, data is a stream of bits-- an Ethernet Frame adds logical structure to the binary data.
      * Components of an Ethernet Frame include (focus on the bolded ones):
        * Preamble and SFD: Notify the receiving device to expect frame data and identify the start point of that data.
          * Preamble is 7 bytes (56 bits) and SFD is one byte (8 bits)
        * **Source and Destination Mac address**
          * **Each is six bytes (48 bites). Source address is the address of the device that created the frame, destination address is the address of the device for which the data is ultimately intended.**
        * Length
          * Two bytes (16 bits) that indicate the size of the Data Payload.
        * DSAP, SSAP, Control
          * Each is one byte (8 bits). DSAP and SSAP indicate the Network Protocol used for the Data Payload, while the Control field provides info abotu the communication mode for the frame.
        * **Data Payload**
          * **Can be btw. 42 and 1497 bytes in length. Contains (encapsulation mechanism for) the entire PDU from the layer above, for ex. an IP Packet. **
        * Frame Check Sequence (FCS)
          * Final 4 bytes: a checksum generated by the device that originated the frame. Receiving device uses same algo to generate and compare an FCS, dropping the frame if the two don't match. Ethernet doesn't implement retransmission functionality for dropped frames (higher level protocols might handle that).
* **The Internet/Network Layer**
  * The Internet Protocol is the predominant protocol used at this layer for inter-network communication.
    * There are two versions of IP currently in use: **IPv4** and **IPv6**.
  * What are the primary features of the Internet Protocol?
    * Routing capability via IP addressing
    * Encapsulation of data into packets
  * Data Packets in the IP Protocol
    * The Protocol Data Unit (PDU) in the IP Protocol is referred to as a *packet*.
    * A packet is comprised of a Data Payload and a header.
    * The Data Payload of an IP Packet is the PDU from the Transport layer (the layer above)
      * Generally a TCP segment or a UDP datagram
    * Header fields include:
      * **Version**: version of the Internet Protocol used, i.e. IPv4
      * **ID, Flags, Fragment Offset**: if the Transport layer PDU is too big to be sent as a single packet, it can be fragmented, sent as multiple packets, and reassembled by recipient
      * **TTL**: Time to Live value, the max number of network 'hops' a packet takes before dropping
      * **Protocol**: e.g. TCP, UDP, etc.
      * **Checksum**: error checking value generated via algo by sender/receiver, packet is dropped if values don't match. IP doesn't manage retransmission, higher layers do
      * **Source Address**: 32bit IP address of packet source
      * **Destination Address**: 32 bit IP address of packet destination
  * IPv4 Addresses
    * Unlike MAC addresses, IP addresses are logical in nature-- assigned as required to devices as they join a network (instead of burned-in to the device).
    * IPv4 addresses are 32 bits in length, in four sections of eight bits each. When converted from binary to decimal, each of those sections contains a range of numbers from `0` - `255` (`2^8`)
    * Packets are routed according to the local routing tables that routers each have. When an IP packet is received by a router, the router examines the destination IP address and matches it against a list of network addresses in its routing table.
  * IPv6 Addresses
    * There is a logical maximum of about 4.3 billion IPv4 addresses, because of their structure.
    * The IETF has been working on IPv6 since the 1990s in order to ensure that the entire pool of IP addresses won't be depleted-- IPv6 uses 128 bit addresses, resulting in 340 undecillion possible addresses.