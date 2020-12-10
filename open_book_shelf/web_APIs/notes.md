## Working with Web APIs Book

###### Source: Launch School Open Bookshelf @ www.launchschool.com/books/working_with_apis/



### Getting Started

* **Preparations**
  * [HTTPie](https://github.com/httpie/httpie) (cmd line app`http --help`)
  * [Postman](https://www.postman.com/)
* **Using Postman**
  * Making a Request
    * <img src="https://d186loudes4jlv.cloudfront.net/api/images/tealeaf-postman-intro.png" alt="img" style="zoom:45%;float:left" />
  * Checking the weather
    * <img src="https://d186loudes4jlv.cloudfront.net/api/images/tealeaf-postman-weather-portland-default.png" alt="img" style="zoom:45%;float:left" />
  * Summary
    * Postman makes it easy to make HTTP Requests from a web browser
    * Postman has few dependencies and is easy to install, since it runs in a web browser

_________

### API Basics

* **Defining API**
  * **Web API**s allow one system to interact with another over HTTP (just like the web).
  * The system offering the API for use by others is the **provider**.
  * The system interacting with the API to accomplish a goal is the **consumer**.
  * It is best to prefer the terms **provider** and **consumer** over *client* and *server*.
* **What APIs Can Do**
  * APIs break down the walls between systems, allowing them to share data.
  * APIs provide an "escape hatch" enabling service users to customize the software's behavior or integrate it into other systems if required.
  * Many modern web applications provide an API that allows developers to integrate their own code with these applications, taking advantage of the services' functionality in their own apps.
* **Accessibility**
  * APIs come in two flavors: **public** and **private**. You will generally work with public APIs; using private APIs is most common when they are your own.
  * API usage is often conditional on the acceptance of a set of terms (TOC) set by the API provider.
* **A Review of HTTP**
  * Web APIs are built on top of the HTTP request/response cycle, the tech that makes the web work.
  * HTTP Responses have 3 main parts: status code, headers, and body.
  * The `Content-Type` header describes the format of the response body.
* **A Review of URLs**
  * Working with web APIs involves working with **URL**s.
  * URLs represent *where* a resourse is and *how* it can be accessed.
  * URLs typically contain a *scheme, hostname, path,* and sometimes a *query string*.
  * Paths (and URLs) can include *placeholders* when they are written generically.
* **Media Types**
  * **Media types** describe the format of a response's body.
  * Media types are represented in an HTTP response's `Content-Type` header, and as a result, are sometimes referred to as **content types**.
  * **Data serialization** provides a common way for systems to pass data on to each other, with a guarantee that each system will be able to understand the data.
  * JSON is the most popular media type for web APIs and the one this book will focus on.
* **REST and CRUD**
  * A RESTful API Template
    * ![Screen Shot 2020-12-10 at 4.08.46 PM](/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-12-10 at 4.08.46 PM.png)
  * **REST** (REpresentational State Transfer) is a set of conventions about how to build APIs.
  * RESTful APIs consist of CRUD actions on a resource.
  * By limiting actions to CRUD, REST requires thinking in a **resource-oriented way**.
  * It is worth being as RESTful as possible, but there are times when there are better solutions.

________

### Working with an API

* **Fetching Resources**
  * Server Setup
  * Fetching a Resource
  * What is a Resource?
  * Fetching a Collection
  * Elements and Collections
  * Summary
* **Requests in Depth**
  * GET and POST
  * Parts of a Request
  * Summary
* **Creating Resources**
  * HTTP Request side effects
  * Creating a Resource
  * Handling errors
  * Summary
* **More HTTP Methods**
  * Updating a Resource
  * Deleting a Resource

________

### Reference

* **HTTP Response Headers**
  * `Access-Control-Allow-Origin`
  * `Allow`
  * `Content-Length`
  * `Content-Type`
  * `ETag`
  * `Last-Modified`
  * `WWW-Authenticate`
  * `X-*` Headers