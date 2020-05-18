### RB130/Lesson_3 (Core Ruby Tools)

**Abridged Summary**:

* Rubygems provide a library of code that you can download and run or use directly inside your Ruby programs. You use the `gem` command to manage the gems you need.
* Rubygems also provide the mechanisms you need to release your own Gems, which can either be packages of code you `require` into your Ruby programs, or independent Ruby programs that you can run (eg, the `bundle` program from the Bundler gem).
* Ruby projects usually use the Rubygems format.
* Ruby Version Managers help you manage multiple versions of Ruby on a single system. Each Ruby version has its own set of tools such as the `gem` and `bundle` commands.
* Bundler provides the tools you need to describe the dependencies for your Ruby programs. This makes it easy to distribute your program to other systems: Bundler installs all the necessary components, and even ensures that the program uses the correct version of each Gem.
* Rake provides a way to easily manage and run repetitive tasks that a developer needs when working on a project.
* The `.gemspec` file provides information about a Gem. If you decide to release a program or library as a Gem, you must include a `.gemspec` file.
* Consult the resource here if problems ever arise! https://launchschool.com/books/core_ruby_tools



**Summary**:

* This lesson explores some of the most common tools in the Ruby toolbox; namely:
  * **Rubygems**

    * What are the outputs of `gem env`?
    * Ruby version: version number of the Rubby associated with the `gem` command.
    * Ruby executable: location of the Ruby command you should use with the Gems
    * Installation directory: where `gem` installs Gems by default.
    * Remote sources: the remote library used by the `gem` installation.

  * **RVM** and **rbenv**

    * rbenv is slightly easier to use on Macs than RVM

    * Details here: https://launchschool.com/books/core_ruby_tools/read/ruby_version_managers

    * To set a system-wide default version of Ruby using rbenv run:

      * ```ruby
        rbenv global 2.6.3 # or whatever version you need
        ```

    * To override the system default for a specific program, run

      * ```ruby
        cd ~/program/directory
        rbenv local 2.6.3 # or whatever version you need
        ```

      * This creates a `.ruby-version` file in the `~/program/directory` directory. When running programs in this directory, `rbenv` first checks the `.ruby_version` file and uses that version of Ruby for the program.

    * Call `rbenv root` to show the location of the rbenv root directory.

    * rbenv uses `shims` to call programs (incl. `irb`, `rubocop`, `bundler`, `rake`), and stores different `versions` of Ruby.

    * Useful troubleshooting commands in `rbenv`:

      * ```ruby
        rbenv version # current active version
        echo $PATH # confirm that your `shims` directory is early in your PATH
        rbenv which COMMAND # displays disk location of COMMAND
        rbenv rehash # rebuilds `shims` directory
        rbenv root # displays path of rbenv root directory
        rbenv shims # displays a list of all current shims
        gem env # prints a swath of info
        ```

  * **Bundler**

    * The most widely used **dependency manager** in Ruby.
    * Bundler relies on a file called `Gemfile` (a simple Ruby program using a Domain Specific Language to provide details) to tell it which version of Ruby and its Gems it should use. 
    * Given a `Gemfile`, calling `bundle install` scans it, downloads and installs all the dependencies listed, and produces a `Gemfile.lock` file, which shows all the dependencies for your program.
    * Once Bundler has created `Gemfile.lock`, add `require 'bundler/setup'` to the beginning of your app (before any other Gems, and unneeded if the app is a Rails app).
      * `bundle exec` is used primarily to resolve dependency conflicts when issuing shell commands-- ex. `bundle exec rake` (override any dependency issues w/ `Gemfile` specs)
        * Ex. `Gem::LoadError: You have already activated...`
    * If you're adding any new Gems to your project, be sure to add them to `Gemfile` and rerun `bundle install` to make sure they make it into `Gemfile.lock`

  * **Rake**

    * A Rubygem that automates many common functions required to build, test, package, and install programs.

      * Common Rake tasks include: 
        * set up required environment by creating dictionaries and files
        * set up and initialize databases
        * run tests
        * package your application and all of its files for distribution
        * install the application
        * perform common Git tasks
        * rebuild certain files and directories based on changes to other files and directories

    * Rake uses a file named `Rakefile` that lives in your project directory to describe the tasks that Rake can perform/how to perform them.

      * ```ruby
        desc 'Say hello'
        task :hello do
          puts "Hello there. This is the `hello` task."
        end
        
        desc 'Say goodbye'
        task :bye do
          puts 'Bye now!'
        end
        
        desc 'Do everything'
        task :default => [:hello, :bye] # DEFAULT, executed if Rake called w/o a task
        ```

    * See what tasks a `Rakefile` can run with the `rake -T` command

      * ```ruby
        $ bundle exec rake -T
        rake bye			# Say goodbye
        rake default  # Do everything
        rake hello		# Say hello
        ```

    * Use Rake to automate repetitive tasks in your program:

      * Run all tests associated with the program
      * Increment the version number
      * Create your release notes
      * Make a complete backup of your local repo



**Cards**:

* What are Gems? 
  * **RubyGems**, often just called **Gems**, are packages of code that you can dowload, install, and use in your Ruby programs or from the command line.
* What command manages all of your Gems?
  * The `gem` command manages all of your Gems. 
* What command can we use to see where your system has put the various `gem`s?
  * `gem env` will print a long list of information about your RubyGems installation
* What is a Ruby version manager?
  * A program that lets you install, manage, and use multiple versions of Ruby.