## Prep. notes for the RB139 Assessment

**LS Study Guide**:

* **Blocks**

  * Closures and scope

    * What is a closure?
    * What is a "binding" (as they relate to closures)?
    * What are the three ways to form a closure in Ruby?
    * How does variable scope relate to closures?

  * How blocks work, and when we want to use them

    * A block is a type of argument that is passed to a method upon method invocation.

    * Two primary use cases:

      * To defer implementation code until method invocation (flexibility)

        * ```ruby
          # EXAMPLE
          ```

      * To allow methods to perform some kind of 'before' and 'after' action (sandwich code)

        * ```ruby
          # EXAMPLE
          ```

  * Blocks and variable scope

    * Why is variable shadowing an issue when using blocks?
    * What variables are available to a block?
    * Can blocks mutate variables outside of the block?

  * Write methods that use blocks and procs

    * What is the difference between a block and a `Proc`?

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

  * Arguments and return values with blocks

    * Can you call a block by passing in more arguments than the block parameters? With fewer?
    * How does the splat operator (`*`) relate to invoking blocks with vary argument counts?

  * When can you pass a block to a method

    * Which methods in Ruby can take a block parameter?

  * `&:symbol`

    * What are each of the behind the scenes steps that happen when we use `Symbol#to_proc`?

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