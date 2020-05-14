### RB130/Lesson_1: Blocks



**Overview**:

1. What are blocks?
2. How do we write methods that can take a block?
3. When are blocks appropriate to use?



**LS Summary:**

- blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.
- blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about wrong number of arguments passed to it.
- blocks return a value, just like normal methods.
- blocks are a way to defer some implementation decisions to method invocation time. It allows method callers to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.
  - blocks are great for pushing some decisions to method invocation time.
- blocks are a good use case for "sandwich code" scenarios, like closing a `File` automatically.
  - blocks are great for pushing some decisions to method invocation time.
- closures drag their surrounding context/environment around, and this is at the core of how variable scope works.
- when we `yield`, we can also pass arguments to the block.
- when we `yield`, we have to be aware of the block's return value.
- once we understand blocks, we can re-implement many of the common methods in the Ruby core library in our own classes.
- the `Symbol#to_proc` is a nice shortcut when working with collections.



**Vocab**:

* Closure
  * A general programming concept that allows programmers to save a chunk of code and execute it at a later time.
  * Called a "closure" because it binds its surrounding artifacts (variables, methods, objects, etc) and builds an *enclosure* around them so they can be referenced at execution.
  * Closures can be thought of as methods you can pass around and execute, without defining it under a specific name.
  * Implemented in ruby as a `Proc` object, a lambda, or a block.
* Binding
  * The surrounding environment/context of a closure.
  * A closure must keep track of its surrounding context in order to have all the information it needs in order to be executed later. This not only includes **local variables**, but also **method references**, **constants**, and other code.
  * From quiz: `A closure retains access to variables, constants, and methods that were in scope at the time and location you created the closure. It binds some code with the in-scope items.`
* Block parameter
  * 
* Block local variable
  * A special type of local variable where the scope is constrained to the block.
* Arity
  * The rules around the number of arguments that can be passed in to a block, `Proc`, or `lambda`. 
  * Blocks have lenient arity rules, but `Proc`s and `lambda`s have different rules.
* Implicit block
* Explicit block
* `Symbol#to_proc`
  * `(&:to_s)` become `{ |n| n.to_s }`



**Cards**:

* What are the three main way of working with closures in Ruby?

  * Instantiating an object from `Proc`, using **lambdas**, or using **blocks**.

* What are the component parts of the following code sample?

  * `[1, 2, 3].each { |num| puts num }`
  * Calling object: the array `[1, 2, 3]`
  * Method call: `Array#each`
  * Block argument being passed into the method: `{ |num| puts num }`

* When a block is passed into a method as an arguement, will its contents affect the return value of the method call?

  * Depend on the method implementation. `Integer#times` returns `self` (or the calling object), while `Array#map` returns a new array.

* How can we invoke passed in block arguments inside methods?

  * Using the `yield` keyword to execute the block.

* Can a method whose definition includes `yield` be called without passing in a block?

  * Yes, but only if the `yield` is conditional: `yield if block_given?`
  * If the `yield` is not made conditional, then the code will throw `LocalJumpError: no block given (yield)`

* What piece of code do we have to include to ensure that methods including `yield` can be called without passing in a block? Where in our program is that code snippet sourced from/available?

  * What is the primary use case for the method `Kernel#block_given?` 
  * It's available in all levels of code because it's inherited from `Kernel`, which is in the method lookup chain for every object in Ruby

* In the following code snippet, what are the `block parameter` and `block local variable`? `3.times do { |num| puts num }`

  * The **block parameter** is inside the two `| |` pipes: `num`
  * The **block local variable** is the `num` that follows the invocation of `puts`

* Why do we want to use unique names for block parameters, avoiding the names of local variables outside the scope of the block?

  * To avoid **variable shadowing**.

* What are the arity rules for blocks in Ruby?

  * Do blocks have lenient arity rules (do they enforce argument count)?
  * Can you pass in different numbers of arguments than defined to a block?

* What are two main use cases for blocks in your code?

  * Deferring implementation code to method invocation decisions. (Implement in a generic way, allowing flexibility of use)

    * Think of the implementation `Array#select`: it leaves the selection logic up to the method caller-- what if it were `Array#select_odds`, or `Array#select_greater_than(num)`. Vastly less useful!

  * Methods that need to perform some "before" and "after" actions-- **sandwich code**.

    * Example use cases: timing, logging, notification systems, resource management, etc.

    * ```ruby
      def time_it
        time_before = Time.now  # before code
        yield                   # execute the implicit block
        time_after = Time.now   # after code
        
        puts "It took #{time_after - time_before} seconds."
      end
      
      time_it { sleep(3) }
      ```

    * ```ruby
      # bad example
      my_file = File.open("some_file.txt", "w+")
      # [...]         write to file
      my_file.close # what if we forgot to do this????
      
      ## VERSUS
      
      # good example
      File.open("some_file.txt", "w+") do |file|
        # write to file
      end
      
      # File::open opens the file, yield to block, then closes file.
      ```

* What are the two main roles involved with any method? Why is each important?

  * The **method implementor** and the **method caller**. 

* Which methods take implicit blocks?

  * Every method, regardless of its definition, takes an implicit block. It may ignore the implicit block, but it still accepts it.

* How can we instruct a method to take an **explicit block**?

  * Prepend the block parameter with a `&`: `def test(&block); end`. It is later called without the `&`, like normal.

* What occurs to a block when it is called explicitly (prepended with a `&` as a parameter during method definition)?

  * The `block` local variable passed in as an argument is converted to a simple `Proc` object.

* What happens behind the scenes when calling a block explicitly?

  * Calling a block explicitly converts it to a `Proc`, which gives us additional flexibility. Instead of being limited to calling the block with `yield`, we can now *pass the block to another method* inside the method if we so desire.

* What happens when we put `&` in front of an object?

  * The Ruby interpreter tries to convert the object into a block.
  * If the object is not a `Proc`, it will call `#to_proc` on it.
    * Returning either a `Proc` or throwing an error.
  * `Symbol#to_proc` returns a `Proc`, which `&` turns into a block.

* What do we mean when we say that a closure creates a binding?

  * A closure retains access to variables, constants, and methods that were in scope at the time and location you created the closure.

* What methods in Ruby can take a block?

  * Any method in Ruby can take an optional block as an implicit parameter. If the method doesn't use the block (by calling `yield`), the method ignores it.

* What boolean method can we use to return `true` if yield would execute a block in the current context (read: if a block was passed to the method)?

  * What does `Kernel#block_given?` check for?

* What happens if you pass more arguments to a block than the block parameter list shows?

  * The block will ignore the extra arguments and execute normally.

* What happens if you pass fewer arguments to a block than the block parameter list shows?

  * The omitted arguments will be accessible, but point to `nil`.

* What might cause this error to be thrown? `LocalJumpError: no block given (yield)`?

  * Invoking a method without a block, but calling `yield` inside that method. 

* How can we explicitly pass in a block to a method? What happens behind the scenes when a block is called explicitly?

  * A block can be passed in explicitly by prepending `&` to the parameter in the method definition (`def true_or_false(&block)`). The block is converted to a `Proc` object and assigned to a local variable.

* What method is called behind the scenes in the following code? `arr.map(&:upcase)`

  * `Symbol#to_proc` is called on the symbol, converting it to a `Proc` object.

* Can we use `.call` to execute a block inside a method?

  * No, the method is `Proc#call`-- the block has to be converted to a `Proc` first (perhaps by calling the block explicitly)

* 

