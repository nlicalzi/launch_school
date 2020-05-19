## Prep. notes for the RB139 Assessment

**LS Study Guide**:

* **Blocks**

  * Closures and scope

    * What is a closure?
      * A general programming concept that allows programmers to save a chunk of code and execute it at a later time. 
      * Called a "closure" because it binds its surrounding artifacts (variables, methods, objects, etc. that are in scope) and builds an *enclosure* around them so they can be referenced at the time of execution.
      * Closures can be thought of as methods that you can pass around and execute, without defining them under a specific name.
    * What is a "binding" (as they relate to closures)?
      * A closure's binding is its surrounding environment/context (scope) at the time of initialization. 
      * A closure retains access to variables, constants, and methods that were in scope at the time and location you created the closure. It binds some code with the in-scope items.
    * What are the three ways to form a closure in Ruby?
      * Initializing a `Proc` object (either by calling `Proc.new` or passing an explicit block to a method)
      * Passing a block argument to a method.
      * Using a `lambda`
      * Note: the distinction is that blocks are not objects, while `Proc`s are. A `Proc` is a block that has been/can be assigned to a variable.
    * How does variable scope relate to closures?
      * Closures "drag" their scope or surrounding environment at time of definition around to the time of invocation.

  * How blocks work, and when we want to use them

    * A block is a type of argument that is passed to a method upon method invocation.

    * Two primary use cases:

      * To defer implementation code until method invocation (flexibility)

        * ```ruby
          # Why Array#select instead of defining Array#select_evens ?
          def select(arr)
            out = []
            counter = 0
            
            while counter < arr.size
              el = arr[counter]
              out << el if yield(el)  # flexible! 
              counter += 1
            end
            
            out
          end
          ```

      * To allow methods to perform some kind of 'before' and 'after' action (sandwich code)

        * ```ruby
          # Ex. timing/logging
          
          def time_it
            time_before = Time.now
            yield # the block below will 'sleep' for 2 seconds here
            time_after = Time.now
            
            puts "The code was executed in #{time_after - time_before} seconds."
          end
          
          puts time_it { sleep(2) }
          
          # Ex. resource management
          
          File.open("file.txt", "r") do |file|
            yield # do whatever
            # File#open opens & closes the file automatically around the block
          end
          ```

  * Blocks and variable scope

    * Why is variable shadowing an issue when using blocks?
      * We want to use unique names for block parameters, because if we reuse the name of a variable defined in an accessible scope outside of the block as a block parameter, then we won't be able to access the original outer scoped variable.
    * What variables are available to a block?
      * Every object that was in scope when the block was created/called.

  * Write methods that use blocks and procs

    * What is the difference between a block and a `Proc`?

    * How do we pass an explicit block to a method vs. passing a `Proc`?

      * ```ruby
        def run_block_with_random_number(&block)
          block.call(rand)
        end
        
        run_block_with_random_number { |n| puts "#{n}!" }
        ```

      * ```ruby
        def run_proc_with_random_number(proc)
          proc.call(rand)
        end
          
        proc = Proc.new { |n| puts "#{n}!" }
        run_proc_with_random_number(proc)
        ```

  * Methods with an explicit block parameter

    * What happens to a block when it is passed to a method explicitly?

    * How can we pass a block to a method explicitly?

      * `def explicit_pass(&block); end`

    * How do we execute a block that has been passed implicitly to a method? Explicitly?

      * ```ruby
        def return_new_array(arr, &block)
          return arr unless block_given?
          arr.map { |el| result << block.call(el)}
        end
        
        def mutate_input_array(arr, &block)
          return arr unless block_given?
          arr.each_with_index { |el, idx| arr[idx] = block.call(el) }
          arr
        end
        ```

    * What is the difference between passing a block implicitly or explicitly to a method?

      * An implicit block can be passed to any method in Ruby, but will only be utilized if the method includes a `yield` call. A block can be passed explicitly by including `&block` as a parameter during method definition; that block will then be called by calling `block.call` inside the method. When a block is passed to that method afterwards, it will be automatically converted to a `Proc`. 

  * Arguments and return values with blocks

    * What is **arity**? What are the **arity** rules for blocks?
      * An object's **arity** is the number of arguments or operands that a function can take. Think of the *ternary operator*: it takes a condition and then returns one of two options (3-arity). Binary: or//and, etc.
      * Blocks have *loose* arity rules, meaning they can take any number of arguments.
    * Can you call a block by passing in more arguments than the block parameters? With fewer?
      * You can call a block by passing in more arguments or fewer arguments than the block has block parameters. If you pass in more arguments, any extra arguments will be ignored, while if you pass in fewer arguments, any remaining parameters will be assigned to `nil`.
    * How does the splat operator (`*`) relate to invoking blocks with varying argument counts?
      * The `*` splat operator "makes space" for an undetermined (/extendable) number of arguments. You can add parameters before or after the splatted parameter and it will expand/contract as necessary.

  * When can you pass a block to a method

    * Which methods in Ruby can take a block parameter?

  * `&:symbol`

    * What are each of the behind the scenes steps that happen when we use `Symbol#to_proc`?

      * `Symbol#to_proc` returns a `Proc` object corresponding to the passed method given as a symbol.

    * Give an example of using `Symbol#to_proc` in code.

      * ```ruby
        "HELLO".chars.map(&:downcase).join # => "hello"
        
        # behind the scenes:
        # .map(&:downcase) SAME AS
        # .map { |el| el.downcase }
        ```

    * What do we call `&` when it is used by itself to prepend some other code? (Unary 'and')

* **Testing with Minitest**

  * Testing terminology
    * What is testing? Why do we test our code?
  * Minitest vs. RSpec
    * What are Minitest and RSpec? Why would we use them?
  * SEAT approach
    * What is the SEAT approach?
  * Assertions
    * What is the most common assertion in Minitest? (`assert_equal`)
    * What is the opposite of an assertion?

* **Core Tools / Packaging Code**

  * Purpose of core tools
  * Gemfiles
    * What is a Gemfile? Why do we use it?
    * What belongs in a Gemfile?
    * What file does Bundler read to produce a `Gemfile.lock` when `bundle install` is called?



**Lesson 1 Summary**:

**Lesson 2 Summary**:

**Lesson 3 Summary**:



**Vocab**:

* **Binding**
  * A binding, or *name binding* binds a name to a memory reference: ex. a variable's name to its value.
* **Scope**
  * The bindings available at a specific part of the code. 
  * Types: local scope, instance scope, class scope, global scope.

* **Closure**
  * A record storing a function with an environment (a mapping to the variables that were in scope when the closure was created).
  * A technique for implementing lexically scoped name binding in a language with first-class functions (functions that can be bound to variables, passed as arguments, returned from functions, etc.).



**Anki cards**:

* What error is thrown when we try to reference a variable or a method that is out of scope?
  * `NameError (undefined local variable or method)`
* What happens behind the scenes when we create a closure?
  * A binding is created, encapsulating the execution context at some particular place in the code and retaining this context for future use. This allows those references to be referenced later by the closure even if they are out of scope when it is executed.
* 