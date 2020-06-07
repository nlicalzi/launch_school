## RB175: Networked Applications



### Summary

This course will cover server side development from first principles. We'll build on your knowledge of HTTP and the request/response cycle to create a dynamic web application from scratch, before moving on to build some more complex applications using a lightweight development framework. We'll also talk about other development considerations such as deployment and security, and deploy an application to Heroku.



### What to focus on

* **HTTP**: When working with Sinatra, focus on what's going on under the hood. Web development frameworks abstract away a lot of the detail, but at the base level we're still dealing with HTTP, request/response, and URL parsing. Try to focus on those things when building applications.
* **Stay high-level**: Aim to understand *what* a web development framework does, rather than focusing on Sinatra specifics. Think about what is happening at a general level, such as what a route is, what a template is, and how they work together.
* **Get comfortable with the development process**: We'll work on iteratively adding features to a web application using a development workflow. As part of this workflow we'll also cover testing your web application. Familiarize yourself with this process and add to the non-technical side of your skillset!



### Detailed Syllabus

* Handling HTTP Requests
  * A simple echo server
  * Parsing paths and parameters
  * Sending a complete HTTP response
  * Dealing with empty HTTP requests
  * Persisting states in the URL
* Project: Build a Book Reading App
  * How routes work
  * Rendering templates
  * Project: build a book reading app
  * Showing table of contents
  * Adding a chapter page
  * Using layouts to remove duplication between templates
  * Working with route parameters
  * Working with filters
  * View helpers
  * Redirecting
  * Adding a search form
* Project: Build a Todo List
  * What is state?
  * Viewing all todo list
  * Creating a new todo list
  * Designing URLs
  * Clearing cookies
  * Flash messages
  * Validations
  * Capturing template content for display elsewhere
  * Editing todo lists
  * Deleting todo list
  * Adding todos to a list
  * Marking todos as completed
  * Completing all todos in a list
  * Using view helpers to apply styles
  * Sorting and filtering with helpers
* Securing Applications
  * Sanitizing HTML
  * Handling bad input
* Adding JavaScript
  * Including JavaScript files
  * Confirming destructive actions
  * Making HTTP requests from JavaScriptg