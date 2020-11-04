## RB175 Networked Applications: Lesson Notes

### Rack

* What is Rack?
  * A generic interface (~protocol) to help application developers to connect to web servers.
  * A specification of what a server should send to an app, and what an app should send to a server.
* Can be used to help connect to WEBrick, an HTTP server toolkit gem for Ruby.
* Requires a `rackup` config file w/ ext. `.ru` that is a Ruby object and will respond to `call(env)`
  * `call(env)` always returns an array containing a *status code*, *headers*, and a *response body*.
    * Status code: a string or another object that can respond to `to_i`
    * Headers: a hash consisting of key-value pairs
    * Response body: any object, as long as it responds to an `each` method and yields a `String`
    * `require_relative` our app file, and call `run` on the app we want to run



### Sinatra

* Sinatra provides a DSL for defining routes, allowing a developer to map URL patterns to Ruby code.

  * ```ruby
    require "sinatra"
    require "sinatra/reloader"  # reload files on every page load
    
    get "/" do									# declare a route matching the URL "/"
      File.read "public/template.html"
    end
    ```

* How can we use layouts and view templates together in an `.erb` file?

  * ```ruby
    get '/' do
      erb :index, layout: :post # specify layout file w/ an arg
    end
    ```

  * ```ruby
    get '/' do
      erb :index # layout.erb is used by default
    end
    ```

* How can we define a single route that handles all chapters?

  * ```ruby
    get "/chapters/:number" do end
    ```

* What is a useful way to define code once in a program, setting up globally needed data?

  * ```ruby
    before do # use a before filter!
      @contents = File.readlines("data/toc.txt")
    end
    ```

* What can we use to filter/process/[something else] data?

  * ```ruby
    helpers do # a View Helper!
      def slugify(text)
        text.downcase.gsub(/\s+/, "-").gsub(/[^\w-]/, "")
      end
      
      def in_paragraphs(text)
        text.split("\n\n").map do |graf|
          "<p>#{graf}</p>"
        end.join
      end
    end
    
    <a href="/articles/<%= slugify(@title) %>"><%= @title %></a>
    	#=> <a href="/articles/today-is-the-day">Today is the Day</a>
    ```

* How can we handle a user attempting to visit an invalid path?

  * ```ruby
    not_found do    # if a user tries a bad path...
      redirect "/"  # redirect to homepage (using Location header in HTTP Response)
    end
    ```

* 



### General

* What is an application server?
* What is a web server?
* What is a view template?
  * What do we call a file that allows us to do some pre-processing on the server side in a programming language before translating programming code into a string to return to the client (usually HTML)?
* What templating engine allows us to embed Ruby directly into HTML?
  * What is `erb` / an `.erb` file?
* Describe the parties / roles / relationships at each step of the following diagram(s)
  * ![img](https://miro.medium.com/max/1046/1*k7cbm7xNb31rNwTDnsWvgQ.png)
  * ![img](https://miro.medium.com/max/1962/1*Z2ftxFcb03ZVU7Uml-SdIg.png)