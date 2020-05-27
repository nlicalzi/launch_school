## LS 170 Lesson 4: Working with HTTP



### Overview:

1. What to focus on
   * Focus on HTTP
     * How does HTTP function at a practical level?
     * How does HTTP enable network communication between a client and a server?
   * HTTP is concerned with the structure of messages
     * HTTP is a set of rules concerned with the syntax and structure of message exchange btw. applications
     * What do those rules mean? When and how do we apply them?
   * HTTP is a Request-Response protocol
     * Form a solid mental model of this behavior
2. Using Telnet to explore HTTP
3. Speaking the Same Language
4. Implementing Our Own HTTP Server: Project Overview
5. Bash Basics
6. Working with netcat
7. Implementing our own HTTP Server:
   1. Basic Program Structure
   2. Sending a Simple Response
   3. Processing the Request
   4. Serving HTML
   5. Working with the Browser
   6. Adding Hyperlinks

### Summary:



### Notes:

* Using telnet/netcet (`nc`) to explore HTTP
  * How can we use `nc` to connect to google.com?
    * `nc -v google.com 80` (port 80 for HTTP requests)
  * Once we have a connection, how do we get the homepage?
    * `GET /`