## Overview of RB130 (Ruby Foundations: More Topics)



**Lesson 1**: Blocks

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

**Lesson 2**: Introduction to Testing

- Minitest is the default testing library that comes with Ruby.
- Minitest tests come in 2 flavors: assert-style and spec-style. Unless you really like RSpec, use assert-style.
- A test suite contains many tests. A test can contain many assertions.
- Use `assert_equal` liberally, but don't be afraid to look up other assertions when necessary. Remember that `assert_equal` is for asserting value equality as determined by the `==` method.
- Use the SEAT approach to writing tests.
- Use code coverage as a metric to gauge test quality. (But not the only metric.)
- Practice writing tests -- it's easy!

**Lesson 3**: Packaging Code Into a Project

