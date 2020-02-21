### Notes from OOP Book in Lesson 1

* What is the Ruby naming procedure for a class vs. a file?

  * Classes are defined using CamelCase (i.e. `class GoodDog...end`), while Ruby files are in snake_case and should reflect the class name (i.e. `good_dog.rb`)

* What is the workflow of creating a new object or instance from a class called?

  * What is **instantiation**?

* What method invocation do we use in Ruby to **mixin** a module to a class?

  * What is the `#include` method used for in Ruby?

* What method can we use to examine the **method lookup** chain in Ruby?

  * What purpose does the `#ancestors` method serve in Ruby?

* How do we instantiate an object in Ruby?

  * We instantiate an object in Ruby by calling the class method `new` on a class.

  * ```Ruby
    class Text
    end
    
    text_obj = Text.new
    text_obj.class # => Text
    ```

* What is the meaning of a **state**, in the context of defining a class?

  * States represent the tracking of attributes for individual objects (tracked in **instance vars**: `@var`)

* What is the meaning of a **behavior**, in the context of defining a class?

  * Behaviors represent what objects are capable of doing, and are available as **instance methods**.

* What method in a class (the **constructor**) is automatically called as soon as you instantiate a new object from that class?

  * What function does the `#initialize` method in a class serve? When is it called? What is it also known as?

* How does the constructor in Ruby initialize our instance variables?

  * Instance variables (`@var`) are set to the argument that is passed in to `#initialize` through the invocation of `new`

* What are two ways of defining **setter** methods in Ruby?
  * The setter method `#name` may be defined either as `def name=(name)` or as `attr_writer :name`

* What is the simple way of defining **getter** methods in Ruby?
  * `attr_reader :name`

* How can we define both a **setter** and a **getter** method in one line in Ruby?

  * `attr_accessor :method`

* How can we tell Ruby that we're calling a **getter/setter** method (or any instance method) from inside a class?

  * We can use `self`:

    * ```Ruby
      def change_info(n, h, w)
        self.name = n
        self.height = h
        self.weight = w
      end
      
      def info
        "#{self.name} weights #{self.weight} and is #{self.height} tall."
      end
      ```

* What are **class methods**? How do we define them? 

  * What is the name for methods we call directly on the class itself, without first instantiating objects, like this: `def self.what_am_i` 

* Why are **class methods** useful?
  * While individual objects contain **state** (instance vars), class methods do not need to deal with individual **states**.
* What is the difference between calling `puts` and `p` on an object?
  * `puts obj` is equivalent to `puts obj.to_s`
  * `p obj` is equivalent to `p obj.inspect` 
* What method is automatically called on an object when we use it with `puts` or with **string interpolation**? What does it return?
  * When is `#to_s` automatically called on an object? What does it return?
* How do we allow Ruby to disambiguate between initializing a **local variable** and calling a **setter method**?
  * Why would we use `self` when calling **setter methods** from within a class?

* Why would we prepend `self` to a method definition inside a class?
  * How do we define a **class method** in Ruby?
* When does `self` reference an instance vs. referencing a class?
  * `self` references an instance when inside an instance method, and references a class otherwise.
* What does **inheritance** refer to in Ruby?
  * What is it called when a class uses the keyword `include` with a module, or `<` with a class?
* In the context of inheritance, what do **superclass** and **subclass** mean?
  * The **subclass** inherits behavior from the **superclass**.
* What method in Ruby allows us to call methods further up the inheritance hierarchy, returning the result from calling the parent method?
  * What is the `#super` method used to accomplish in Ruby?
* How is `#super` used without arguments?
  * When called without arguments, `#super` will pass along the arguments for the *original* method call to the *new* one. 
* How is `#super` used with arguments?
  * `#super` can either be called with named args (`super(arg1, arg2...)`) or with no arguments when the parent method takes a different number of arguments (`super()`).
* What is the naming convention for modules in Ruby?
  * the `'-able'` suffix should be appended to whatever verb describes the behavior that the module is modeling (think: `Enumerable`, or `Swimmable`, etc.)
* What are the two types of **inheritance** in Ruby, and how are they implemented?
  * **Class inheritance**: one class inherits the behaviors of another type.
  * **Interface inheritance**: a class inherits the interface (public behaviors) provided by the mixed-in modules. 
* What is a mnemonic we can use to remember when to use class inheritance vs. mixins?
  * **"is-a"** relationships should use class inheritance: `Dog` is an `Animal`
  * **"has-a"** relationships should use mixins: `Dog` has the ability to `Swimmable`

* Why does the order in which modules are `include`d in a class important?
  * The last module included comes first in the lookup.
* Why are modules useful for in Ruby?
  * **Namespacing**: The organization of similar classes under a module to avoid conflicts.
    * i.e. `Cat` and `Dog` as classes in the `Mammal` module. 
  * **Containers**: the use of modules as containers for methods (**module methods**
* When is a **public** method (part of an object's **interface**) available?
  * What are methods called that are available to anyone who knows either the class or object's name? What do they comprise?
* What is the use case for a **private method** (defined using `private` and accessed prepended with `self.`)? 
  * What kinds of methods do work within a class, without needing to be available to the rest of a program as part of its **interface**? How are they defined/accessed?
* What kind of method is accessible like a **public** one from within a class but like a **private** one from outside of it?
  * What is a **protected** method? 



### Notecards from Lesson 2

* 