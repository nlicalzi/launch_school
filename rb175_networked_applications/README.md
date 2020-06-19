## RB175: Networked Applications



### Overview

This course will cover server side development from first principles. We'll build on your knowledge of HTTP and the request/response cycle to create a dynamic web application from scratch, before moving on to build some more complex applications using a lightweight development framework. We'll also talk about other development considerations such as deployment and security, and deploy an application to Heroku.



### What to focus on

* **HTTP**: When working with Sinatra, focus on what's going on under the hood. Web development frameworks abstract away a lot of the detail, but at the base level we're still dealing with HTTP, request/response, and URL parsing. Try to focus on those things when building applications.
* **Stay high-level**: Aim to understand *what* a web development framework does, rather than focusing on Sinatra specifics. Think about what is happening at a general level, such as what a route is, what a template is, and how they work together.
* **Get comfortable with the development process**: We'll work on iteratively adding features to a web application using a development workflow. As part of this workflow we'll also cover testing your web application. Familiarize yourself with this process and add to the non-technical side of your skillset!



### Detailed Summary

* Handling HTTP Requests
  * Although it is not something you'd normally do, it is possible to interact with HTTP manually because it is a *text-based protocol*.
  * HTTP is built on top of TCP, which is a networking layer that handles communicating between two computers.
  * *URLs* are made up of many components: a *protocol*, a *host*, a *port*, a *path*, and *parameters*.
  * *Query parameters* are parameters that are included in a URL. They are appended to the path using `?`. Parameters are specified in the URL using the form `key=value`.
  * Parameters after the first are appended to the URL using `&`.
  * HTTP is stateless, which means that each request is handled separately by the server. By carefully crafting URLs and parameters, stateful interactions can be built on top of HTTP.
* Working with Sinatra
  * *Sinatra* is a small web framework
  * HTTP requests are handled in Sinatra by creating `routes` for a path or set of paths.
  * Routes are created using methods named after the HTTP method to be handled. So, a `GET` request is handled by a route defined using the `get` Sinatra method.
  * *View templates* can be written in many *templating languages*, such as *ERB*. They provide a place to define the HTML display of a response outside of the route handling it. Templating languages are usually better suited to describing HTML than plain Ruby.
  * A *layout* is a view template that surrounds a specific responses template. They are used to provide shared HTML that is used by all views, and often include links to stylesheets and JavaScript files.
  * Routes can specify *parameters* by using a colon followed by the parameter name: `/chapters/:number`. In this case, the value would be accessible within the route using `params[:number]`.
  * Code placed in a `before` block is executed before the matching route for every request.
  * *View helpers* are Ruby methods that are used to minimize the amount of Ruby code included in a view template. These methods are defined within a `helpers` block in Sinatra.
  * A user can be sent to a new location in response to a request with *redirection*. This is done in Sinatra using the `redirect` method.
    * The redirection is accomplished by setting the `Location` header in the response. The client looks at the URL in the location header and sends out a new HTTP GET request for the associated resource, which in turn navigates the client to that new location.
  * The files in a project can be identified as either *server-side* or *client-side* code based on where they will be evaluated.
* Deploying Sinatra Applications
  * `Procfile` defines what types of processes are provided by the application and how to start them.
  * `config.ru` tells the web server how to start the application. In this project, we require the file that contains the Sinatra application and then start it.
  * While WEBrick is a fine server for development, it is better to use a production-ready web server such as Puma when deploying a project.
  * Puma is a threaded web server, which means that it can handle more than one request at a time using a single process. As a result, Puma will perform much better for most applications.
  * A specific version of Ruby can be specified in the `Gemfile` to ensure that the same version is used in both development and production.
* Project: Todos (https://nlicalzi-todolist.herokuapp.com/)
  * *State* is data that persists over time.
  * The *session* provides a way to store data that will persist between subsequent HTTP requests. This data is associated with a specific user by storing a cookie in their browser. In Sinatra, the session data itself is also stored in this cookie, but this is configurable and not always the case with other web frameworks.
  * Data that is submitted to the server often needs to be *validated* to ensure it meets the requirements of the application. In this lesson we built *server-side* validation as we performed the validation logic on the server.
  * Messages that need to be displayed to the user on their next request and then deleted can be stored in the session. This kind of message is often referred to as a *flash* message.
  * Content from within a view template can be stored under a name and retrieved later using `content_for` and `yield_content`.
  * `GET` requests should only request data. Any request that modifies data should be over `POST` or another non-GET method.
  * Web browsers don't support request methods other than `GET` or `POST` in HTML forms, so there are times when a developer has to use `POST` even when another method would be more appropriate.
  * View helpers provide a way to extract code that determines what HTML markup is generated for a view.
* Project: File-based CMS
  * Sinatra will render a layout automatically if it is located at `views/layout.erb`.
  * `Rack::Test` is the library used to test Sinatra applications.
  * Calling the `redirect` method in Sinatra aborts the current request.
  * Passwords should never be stored in raw form. They should always be hashed first.
  * Possible extensions to the CMS project:
    * Validate that document names contain an extension that the application supports.
    * Add a "duplicate" button that creates a new document based on an old one.
    * Extend this project with a user signup form.
    * Add the ability to upload images to the CMS (which could be referenced within markdown files).
    * Modify the CMS so that each version of a document is preserved as changes are made to it.

