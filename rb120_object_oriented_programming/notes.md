### Notes for Lesson 3 in RB120/OOP

#### Equality:

* Is "everything an object" 100% true in Ruby?

  * No-- methods, blocks, if statements, argument lists, etc. are not objects. But it is a useful shorthand!

* `#==` quick hits:

  * for most objects, the `==` operator compares the values of the objects, and is frequently used.
  * the `==` operator is actually a method. Most built-in Ruby classes, like `Array`, `String`, `Integer`, etc override the `==` method to specify how to compare objects of those classes.
  * by default, `BasicObject#==` does not perform an equality check; instead, it returns true if two objects are the same object. This is why other classes often override the behavior of `#==`.
  * if you need to compare custom objects, you should override the `==` method.
  * understanding how this method works is the most important part of this assignment.

* What is the difference between the `#==` method and the `#equal?` method?

  * `==` checks the equivalence of the values contained by each object.
  * `#equal?` checks that the two variables actually point to the same object.
    * `#equal?` is the same as doing `obj1.object_id == obj2.object_id`
  * Remember lessons from "Variables as Pointers" section!

* Is `==` a method or an operator?

  * It's actually an instance method available on all objects! It just looks like a normal operator because of Ruby's syntactical sugar. Otherwise we'd have to call it as `obj1.==(obj2)` instead of `obj1 == obj2`

* How does the `#==` method know what value to use for comparison?

  * The instance method implementation is determined by the class. The base `#==` method comes from the `BasicObject` class but each custom subclass should override the inherited method and implement its own like how we did for `<` and `>` in RPS.
  * `Array`, `Hash`, `Integer`, and `String` each have their own custom implementation for `#==`, so it can generally be used safely with instances of those classes.

* Is calling `45 == 45.00` the same as calling `45.00 == 45`?

  * No! The first snippet uses `Integer#==` while the second uses `Float#==`-- luckily, the results are consistent because the creators of those methods implemented them that way.

* Look at the implementation for `#===` in classes like `Range` and make a couple of study cards about it.

  * When `===` compares two objects, such as `(1..50)` and `25`, it's essentially asking "if `(1..50)` is a group, would `25` belong in that group?" 

  * ```Ruby
    String === "hello" # => true
    String === 15      # => false
    ```

* What does `#eql?` determine? 

  * If two objects contain the same value and if they're of the same class.
  * Mostly used as `Hash#eql?`, but not used often.



#### Variable Scope:

* **Instance Variable Scope**
  * Instance variables are variables that start with `@` and are scoped at the object level.
  * They are used to track individual object state.
  * If you try to reference an uninitialized local variable, you get a `NameError`, but referencing an uninitialized instance variable returns `nil`.
* **Class Variable Scope**
  * All instances of a class share 1 copy of the class's variables.
  * Class methods can access class variables, regardless of where they're initialized.
* **Constant Scope**
  * Constants defined in a class are available in class and instance methods
  * Constant Lookup Paths
    * Read this: https://cirw.in/blog/constant-lookup.html
* 