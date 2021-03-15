## Notes on "[Demystifying Rails](https://launchschool.com/books/demystifying_rails/read/introduction)" at Launch School

### No Magic Rails

* **Sending Requests and Responses**

  * Routes live in the `config/routes.rb` file

    * ```ruby
      Rails.application.routes.draw do
        get '/hello_world' => 'application#hello_world'
        # code lives in ApplicationController's 'hello_world' action
      end
      ```

  * Controllers live in the `app/controllers/` directory:

    * ```ruby
      class ApplicationController < ActionController::Base
        def hello_world
          render 'application/hello_world'
          # like: render inline: File.read('app/views/application/hello_world.html')
        end
      end
      ```

* **Rendering HTML with Views**

  * Controllers delegate responsibilities to other parts of the application.

  * HTML content belongs in a View, which live in the `app/views/[controller]` directory

    * ```html
      <!-- app/views/application/hello_world.html -->
      <html>
        <body>
          <p>
            Hello, world!
          </p>
        </body>
      </html>
      ```

* **Making our App Dynamic**

  * The dynamic nature of web apps come mainly from two sources:

    * The client embeds a piece of data inside a URL for the server to respond to.
      * Ex. `https://www.google.com/search?q=robots`
    * The server responds with data based on some internal data state in the server's database.
      * Ex. when visiting a blog, the server retrieves posts from db and assembles a web page.

  * Dynamic documents with Embedded Ruby (`.erb` template files)

    * ERB templates embed Ruby code inside `<%...%>` or `<%= ruby expression %>` tags

    * ```html
      <html>
        <body>
          <% name = "John" %>
          <p>Hello, <%= name %></p>
        </body>
      </html>
      ```

  * Responses with Query Parameters

    * The most basic way to pass values from the client to the server is to use a URL query param:

      * `http://localhost:3000/hello_world?name=John`

      * Rails parses the query parameters into a hash called `params`, which we can then access and pass as `locals` to the ERB rendering engine & an `.erb` file at the `render` path

      * ```ruby
        class ApplicationController < ActionController::Base
          def hello_world
            name = params['name'] || "World"
            render 'application/hello_world', locals: { name: name }
          end
        end
        ```

  * Responses with URL Capture Pattern

    * ```ruby
      # config/routes.rb
      Rails.application.routes.draw do
        get '/hello/:name' => 'application#hello_world' # will render 'hello :name'
      end
      ```

* **Persisting Data in our App**

  * Prepare the Database

    * SQL file naming convention: `db/posts.sql`

      * ```sql
        CREATE TABLE "posts" (
          "id" 					INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          "title" 			varchar,
          "body" 			 	text,
          "author" 		 	varchar,
          "created_at" 	datetime NOT NULL
        );
        ```

    * `db/posts.csv`

      * ```
        1,Blog 1,Lorem ipsum dolor sit amet.,Brad,2014-12-07
        2,Blog 2,Lorem ipsum dolor sit amet.,Chris,2014-12-08
        3,Blog 3,Lorem ipsum dolor sit amet.,Kevin,2014-12-09
        ```

    * ```
      $ sqlite3 db/development.sqlite3 < db/posts.sql
      $ sqlite3 db/development.sqlite3
      
      sqlite> .mode csv
      sqlite> .import db/posts.csv posts
      sqlite> SELECT * FROM posts;
      sqlite> .quit
      ```

* **List and Show Records**

  * ```ruby
    # this... 
    connection.execute("SELECT * FROM posts WHERE posts.id = ? LIMIT 1", params['id'])
    
    # is the same as this:
    connection.execute("SELECT * FROM posts WHERE posts.id = #{params['id']} LIMIT 1")
    ```

  * The `?` placeholder protects against SQL Injection with some Rails magic

  * It's a best practic to extract shared logic for DB connection:

    * ```ruby
      class ApplicationController < ActionController:Base
        def list_posts
          posts = connection.execute("SELECT * FROM posts")
      
          render 'application/list_posts', locals: { posts: posts }
        end
      
        def show_post
          post = connection.execute("SELECT * FROM posts WHERE posts.id = ? LIMIT 1", params['id']).first
      
          render 'application/show_post', locals: { post: post }
        end
      
        private
      
        def connection
          db_connection = SQLite3::Database.new 'db/development.sqlite3'
          db_connection.results_as_hash = true
          db_connection
        end
      end
      ```

* **Create a new Record using a Form**

  * ```ruby
    <form method="post" action="/create_post">
    
          <label for="title">Title</label>
          <input id="title" name="title" type="text" />
          <br /> <br />
    
          <label for="body">Body</label>
          <textarea id="body" name="body"></textarea>
          <br /> <br />
    
          <label for="author">Author</label>
          <input id="author" name="author" type="text" />
          <br /> <br />
    
          <input type="submit" value="Create Post" />
    
    </form>
    ```

* **Edit a Record**

  * ```ruby
      def update_post
        update_query = <<-SQL
          UPDATE posts
          SET title      = ?,
              body       = ?,
              author     = ?
          WHERE posts.id = ?
        SQL
        connection.execute update_query, params['title'], params['body'], params['author'], params['id']
    
        redirect_to '/list_posts'
      end
    ```

* **Find and Delete a Post**

* **Controller Patterns and CRUD**

  * Two typical actions for controllers:
    1. Interacting with the database, either reading (`SELECT`) or writing (`INSERT/UPDATE/DELETE`) data
    2. Retrieving data to render a view template, or redirecting to a different page
  * CRUD: create/read/update/delete , four basic actions to interact with data.

* **Data Encapsulation with Models**

  * If we want to avoid having to scan the entire application code base to make changes to every SQL statement that touches our data, we should leverage **encapsulation** with **models**.

    * ```ruby
      # app/models/post.rb
      
      class Post
        attr_reader :id, :title, :body, :author, :created_at
        
        def initialize(attributes={})
          @id = attributes['id']
          @title = attributes['title']
          @body = attributes['body']
          @author = attributes['author']
          @created_at = attributes['created_at']
        end
      end
      ```

  * Models in Rails are *just Ruby classes*, and they live in the `app/models` directory.

* **Expanded Encapsulation through our Models**

* **Model Validations**

  * ```ruby
    # app/models/post.rb
    
    class Post
      #...
      def valid?
        title.present? && body.present? && author.present?
      end
      
      def save
        return false unless valid?
        new_record? ? insert : update
        true
      end
      #...
    end
    ```

* **A Second Resource**

* **Working with Model Associations**

* **Cleaning up our App**

  * Notice the order in which we write our code: it's a very top-down approach. Start with the route, then move to the view, then to the controller (write the needed action), then based on what model related methods we need, we can proceed to that model and add those methods. 
  * Write the code we want to see, then implement the code as needed!

* **A Base Model**

  * Implement shared functionality in a base model that your specific models can inherit from, and implement them to use *introspection* to determine proper functionality per model/class.

### Rails Core Conventions

##### Controller Versatility

##### Helpers and Forms

#####  Custom Forms

#####  More View Conventions

#####  Active Record Models and Database Management





### Vocab

* Route
* Controller
* Action
* `render`
  * builds the HTTP response
  * takes a hash as an argument
* View
* Redirect vs. Render (on POST vs. GET)