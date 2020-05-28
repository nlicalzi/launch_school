## LS170 Lesson 5: Transport Layer Security (TLS)



### Overview

1. Intro (Why TLS?)
   * HTTP is a text based protocol, transferred across the network in plain text.
   * HTTP is fairly simple, with a basic message structure and set of rules.
   * These characteristics make it easy to design and build with, but make it insecure
     * Easy to read contents of an HTTP message if it's intercepted.
     * Hard to verify if the source of an HTTP message is trustworthy.
     * Hard to know if an HTTP message has been tampered with in transit.
2. What to Focus On
   * Understand that TLS provides for secure message exchange over an unsecure channel
     * What does unsecure HTTP message transfer look like?
     * How can we build on current understanding ot HTTP to understand value of TLS?
   * Learn that there are multiple aspects to security
     * TLS provides a number of different services-- what are they?
     * What does each service provide? What problem does each service solve?
3. **The Transport Layer Security (TLS) Protocol**
4. **TLS Encryption**
5. **TLS Authentication**
6. **TLS Integrity**



### Summary



### Notes

* **The Transport Layer Security (TLS) Protocol**
  * What was the original version of the Transport Layer Security (**TLS**) protocol called? (What evolved out of the Secure Sockets Layer (**SSL**) protocol?)
  * What are the three main security services provided by the Transport Layer Security (**TLS**) protocol? (What protocol provides Encryption, Authentication, and Integrity services?)
  * What do we call the process of encoding a message so that it can only be read by those with an authorized means of decoding that message? (What is encoding?)
  * What do we call the process of verifying the identity of a particular party in a message exchange? (What is authentication?)
  * What do we call the process of detecting whether a message has been interfered with or faked? (What is integrity?)
* **TLS Encryption**
  * What do we call the process by which the Transport Layer Security (**TLS**) protocol sets up an encrypted connection? (What is a TLS Handshake?)
  * What do we call the type of encryption system where sender and receiver share a common encryption key? (What is symmetric key encryption?)
  * What encryption system uses a pair of keys (one public and one private) and works only in one direction? (What is asymmetric key encryption/public key encryption?)
  * What Transport layer protocol does the Transport Layer Security (TLS) protocol assume is being used? (?)
  * What are the two types of encryption used in a Transport Layer Security (TLS) Handshake? (What are symmetric and asymmetric key encryption?)
  * What are the three main outcomes of a TLS Handshake? (How do two clients in a TLS exchange agree on the version of TLS to use, the algorithms in the cipher suite, and exchange their symmetric encryption keys?)
  * What is the impact of a TLS Handshake on latency in a client/server connection (on top of the initial round trip from a TCP handshake)? (What security protocol can add up to 2 round-trips worth of latency to the initialization of a TCP connection?)
  * What security protocol exists for use with network connections using UDP instead of TCP at the Transport layer? (What is the Datagram Transport Layer Security (**DTLS**) protocol?)
  * What do we call a set of steps for performing encryption, decryption, and other related tasks (a.k.a. a cryptographic algorithm)? (What is a cipher/cipher suite?)
  * What do we call the set of algorithms required to perform each task in the Transport Layer Security (TLS) protocol? (How does the Transport Layer Security (TLS) protocol use a cipher suite?)
* **TLS Authentication**
  * What critical piece of the TLS authentication process happens when a server provides its certificate? (When does a server transfer its public key to a client?)
  * What two pieces of data does a server provide to a client to prove that its certificate is valid and it holds the correct private key? (Why does a server provide a signature and the private key used to encrypt it to a client?)
  * What do we call an organization that issues trustworthy certificates? (What is a Certificate Authority (**CA**)?)
* **TLS Integrity**

* Diagrams
  * ![Simple Alice and Bob graphic illustrating the mechanics of asymmetric key encryption](https://da77jsbdz4r05.cloudfront.net/images/ls170/tls-encryption-asymmetric.png)
  * ![Graphic illustrating the steps of TLS Handshake](https://da77jsbdz4r05.cloudfront.net/images/ls170/tls-encryption-tls-handshake.png)
    * https://launchschool.com/lessons/74f1325b/assignments/54f6defcho
  * ![Diagram showing chain of trust structure](https://da77jsbdz4r05.cloudfront.net/images/ls170/tls-authentication-chain-of-trust.png)

