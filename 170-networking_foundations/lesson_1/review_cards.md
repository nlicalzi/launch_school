## LS170 Lesson 1: The Internet (Anki cards)

### Focus:

* Build a general picture of the network infrastructure
  * Build the general mental models that will provide sufficient context to understand protocols operating at higher levels of abstraction, such as TCP and HTTP
* Be aware of the limitations of the physical network
  * TCP and HTTP are bound by limitations of physical infrastructure: latency and bandwidth
* Understand that protocols are systems of rules
* Learn that IP enables communication between devices
  * Form a clear mental model of the Internet Protocol



### Cards:

* What are the two main conceptual components of the Internet?
  * Physical **network infrastructure** and the **protocols** that enable the infrastructure to function.
* What are network protocols?
  * **Systems of rules** governing the exchange or transmission of data over a network; they define the rules, syntax, semantics, and synchronization of communication, as well as possible error recovery methods.
* Why do we use protocols?
  * How can we ensure that disparate components, using a variety of software, are able to connect and successfully/intelligibly transfer information?
* How does data encapsulation apply to network communication models?
  * We hide the data from one protocol layer by encapsulating it within a data unit of the layer below-- higher level PDUs serve as payloads for lower level PDUs.
* What is a Protocol Data Unit (PDU)?
  * What is the name for a single unit of information transmitted among peer entities of a computer network, composed of protocol-specific control information (a header/trailer) and data (a payload from a previous scope).
* What is latency, in terms of the performance of a physical network?
  * What do we call the measure of delay across physical networks, indicating the amount of time it takes for data to travel from one point to another?
* What are the four main types of delay that combine to determine overall latency?
  * Propagation delay, transmission delay, processing delay, queueing delay
* What is propagation delay?
  * What do we call the amount of time it takes for a message to travel from sender to receiver?
* What is transmission delay?
  * What do we call the amount of time it takes to push data onto each link in a network system?
* What is processing delay?
  * What do we call the amount of time it takes each link in a network system to process data?
* What is queueing delay?
  * What do we call the amount of time a data payload spends buffering (waiting in the processing queue), for a router to finish processing previous payloads?
* What is last mile latency?
  * What do we call the delays involved in getting the network signal from your ISP to your home/office network?
* What is Round-trip Time (RTT), in the context of latency?
  * What do we call the length of time for a signal to be sent, plus the amount of time it takes for an acknowledgement or response to be received?
* What is bandwidth, in terms of the performance of a physical network?
  * What do we call the measure of capacity in a physical network, indicating the amount of data that can be transmitted in a set period of time?
* What is multiplexing?
  * What do we call the set of techniques that allow the simultaneous transmission of multiple signals across a single data link, increasing bandwidth?
* What are the four main protocol layers of the TCP/IP suite? (highest level of abstraction to lowest)
  * Application -> Transport -> Internet -> Link. (EXPAND ON THIS)
* What happens at the Link layer of the Internet protocol suite?
  * The Link layer is the group of methods and communications protocols confined to the link that a host is physically connected to. The link is the physical and logical network component used to interconnect hosts or nodes in the network, and a link protocol is a suite of methods and standards that operate only between adjacent network nodes of a network segment.
* What is the PDU at the Link layer?
  * A frame-- the final layer of encapsulation before the data is transmitted over the Physical layer, consisting of a link layer header followed by a packet, and possibly a trailer.
* What is the most common protocol at the Link layer of the Internet protocol suite?
  * What is Ethernet?
* What is an Ethernet Frame?
  * What do we call the PDU for the Ethernet protocol (at the Link layer) of the Internet Protocol?
* What are the two most important components of an Ethernet Frame?
  * What requires a source/destination MAC Address and a data payload (an IP Packet from the Internet layer)?
* What is a MAC Address?
  * What do we call the "burned-in" address that Ethernet Frames use for source/destination addressing in their headers?
* What is the Internet layer of the Internet protocol suite?
  * A group of internetworking methods, protocols, and specifications that are used to transport network packets from the originating host across network boundaries; usually to the destination host specified by an IP address.
* What is the PDU at the Internet layer?
  * An IP Packet-- consisting of a header and payload. Think of a postal letter-- the header is the envelope w/ source/destination addresses on it, the payload is the contents.
* What are the two versions of the Internet Protocol currently in use?
  * IPv4 and IPv6
* What are the two primary features of the Internet Protocol?
  * What enables routing capability via IP addressing and the encapsulation of data into packets?
* What is the main difference between IPv4 and IPv6?
  * IPv4 addresses are 32 bits, while IPv6 addresses are 128 bits-- many orders of magnitude more IPv6 addresses are possible than IPv4 (~4B).
* What is the Transport layer of the Internet protocol suite?
  * The group of methods and communications protocols that provide host-to-host communication services for applications. The services include connection-oriented communication, reliability, flow control, and multiplexing. Typically TCP or UDP-- the two comprise nearly 100% of traffic on the internet.
* What is the PDU at the transport layer?
  * TCP Segment // UDP Datagram

* What is the the Application layer of the Internet protocol suite?
  * The communications protocols and interface methods used in process-to-process communications across an IP computer network. This incudes FTP, HTTP, SSH, SMTP, etc.
* What is the PDU at the application layer?
  * Just the relevant data you're trying to transfer so the application can work!
* Figure out some questions using the following image: (block out the text on the right? on the left?)
  * ![img](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/UDP_encapsulation.svg/1920px-UDP_encapsulation.svg.png)

* What is an IP Address?
  * What do we call the numerical label assigned to each device connected to a computer network that uses the Internet Protocol for communication?