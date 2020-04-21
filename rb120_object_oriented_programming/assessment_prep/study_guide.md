## RB129 Study Guide

#### Outline

1. Classes and objects
   * Anything in Ruby that can have a value is an object
     * Is a method an object? Is a block an object? (no)
   * Objects are created from/defined by classes (think of a blueprint and a building)
   * What method can we call to see the class an object was instantiated from?
     * ```Object#class```
2. Use ```attr_*``` to create setter and getter methods
3. How to call setters and getters
4. Instance methods vs. class methods
5. Referencing and setting instance variables vs. using getters and setters
6. Class inheritance, encapsulation, and polymorphism
7. Modules
8. Method lookup path
   1. ```Class.ancestors``` or ```object.class.ancestors```
9. ```self```
   1. Calling methods with ```self```
   2. More about ```self```
10. Reading OO code
11. Fake operators and equality
12. Truthiness
13. Working with collaborator objects



#### Vocab (What, Why, How, [& Code Example])

* **Object Oriented Programming**

  * A programming paradigm that was created to deal with the growing complexity of large software systems.

* **Encapsulation**

  * Hiding pieces of functionality and making them unavailable to the rest of the code base.
  * A form of data protection, and a way to define boundaries in your application while embracing abstraction

* **Polymorphism**

  * The ability for data to be represented as many different types
  * Gives us flexibility in using pre-written code for new purposes

* **Inheritance**

  * How one class can inherit the behaviors of another class

* **Superclass**

  * The class from which behavior is inherited by a ```subclass```
  * Usually more basic classes with large reusability

* **Subclass**

  * The class that inherits behavior from a ```superclass```
  * Smaller classes with more fine-grained/detailed behaviors

* **Module**

  * A collection of behaviors that is usable in other classes via ```mixins```
  * ```mixin``` a module to a class using the ```include``` method invocation

* **Instantiation**

  * The workflow of creating a new object or an instance from a class.
  * Calling ``Class.new`` returns an object, based on the ```#initialize``` method defined in that class
  * The ```initialize``` method is also known as a *constructor*

* **State**

  * States track attributes for individual objects.
  * (Think instance variables, which are scoped at the instance/object level)

* **Behavior**

  * Behaviors are what objects are capable of doing
  * (Think instance methods)

* **Instance Variable**

  * Instance variables contain an object's *state*-- they exist as long as the object instance exist.

  * ```Ruby
    def initialize(name)
      @name = name
    end	
    ```

* **Instance Method**

  * An instance method is a behavior available to an initialized object of a given class.

* **Getter Method**

  * ```ruby
    def name # Expost an object's state
      @name
    end
    
    # OR
    
    attr_reader :name # SYMBOL AS ARG
    ```

* **Setter Method**

  * ```Ruby
    def name=(n) # Change an object's state
      @name = n
    end
    
    # OR
    
    attr_writer :name # SYMBOL AS ARG
    ```

* 