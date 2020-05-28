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
* **TLS Authentication**
* **TLS Integrity**



