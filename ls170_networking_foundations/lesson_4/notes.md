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
4. Bash Basics
5. Working with netcat
6. Implementing our own HTTP Server:
   1. Basic Program Structure
   2. Sending a Simple Response
   3. Processing the Request
   4. Serving HTML
   5. Working with the Browser
   6. Adding Hyperlinks

### Summary:

* HTTP is a text-based protocol. HTTP Request and Responses involve sending text between the client and server.
* In order for the protocol to work, the Request and Response must be structured in such a way that both the client and the server can understand them.
* With HTTP/1.1, the end of the headers is indicated by an *empty line*.
* The `Content-Length` header can be used to indicate the *size of the body*. This can help determin where the HTTP message should end.



### Notes:

* Using telnet/netcet (`nc`) to explore HTTP

  * How can we use `nc` to connect to google.com?
    * `nc -v google.com 80` (port 80 for HTTP requests)
  * Once we have a connection, how do we get the homepage?
    * `GET /`

* Speaking the Same Language

  * HTTP 0.9 only requires the method and path in the request line (`GET /`)
    * However, some servers no longer support HTTP 0.9 syntax and may return `400 Bad Request`
  * Newer versions of HTTP require the HTTP version be included: `GET / HTTP/0.9`
    * If the HTTP version specified isn't supported, we might get `505 HTTP Version Not Supported`
    * 5xx level response codes indicate an error or issue on server side
  * Always look at the HTTP specifications for the version you are using to see the requirements!
  * Sometimes we get `301 Moved Permanently` responses if we are using command line tools-- a browser would know to automatically issue a new request and redirect to the specified `Location` header URL

* Bash basics (don't worry about memorizing this stuff)

  * We can make a shell file `hello_world.sh` executable by inserting `#!/bin/bash` as the first line, then calling `chmod +x hello_world.sh`.

    * Once we made it executable with `chmod`, we can call it with `./hello_world.sh`

  * Conditional statements use the following syntax:

    * ``` bash
      if [[ <condition> ]] # brackets are shorthand for the test command
      then
        <commands>
      fi
      ```

  * **Strings**

    | Operator               | Description                                           |
    | :--------------------- | :---------------------------------------------------- |
    | `-n string`            | Length of `string` is greater than 0                  |
    | `-z string`            | Length of `string` is 0 (`string` is an empty string) |
    | `string_1 = string_2`  | `string_1` is equal to `string_2`                     |
    | `string_1 != string_2` | `string_1` is not equal to `string_2`                 |

  * **Integers**

    | Operator                  | Description                                         |
    | :------------------------ | :-------------------------------------------------- |
    | `integer_1 -eq integer_2` | `integer_1` is equal to `integer_2`                 |
    | `integer_1 -ne integer_2` | `integer_1` is not equal to `integer_2`             |
    | `integer_1 -gt integer_2` | `integer_1` is greater than `integer_2`             |
    | `integer_1 -ge integer_2` | `integer_1` is greater than or equal to `integer_2` |
    | `integer_1 -lt integer_2` | `integer_1` is less than `integer_2`                |
    | `integer_1 -le integer_2` | `integer_1` is less than or equal to `integer_2`    |

  * **Files**

    | Operator          | Description                                             |
    | :---------------- | :------------------------------------------------------ |
    | `-e path/to/file` | `file` exists                                           |
    | `-f path/to/file` | `file` exists and is a *regular* file (not a directory) |
    | `-d path/to/file` | `file` exists and is a directory                        |

* Working with netcat (`nc`)
  * Netcat is a network utility for reading and writing data across network connections w/ TCP or UDP.
* 