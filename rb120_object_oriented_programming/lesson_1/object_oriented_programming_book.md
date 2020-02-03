# Object Oriented Programming in Ruby

Notes on https://launchschool.com/books/oo_ruby/

## Outline:

1. **The Object Model**

2. **Classes and Objects I**

3. **Classes and Objects II**

4. **Inheritance**



## The Object Model

#### Why Object Oriented Programming?

* OOP is a programming paradigm meant to help deal with the growing complexity of large software systems.
* OOP allows programmers to think on a new level of abstraction from purely functional code.
* Encapsulation allows for the cordoning off of data & functionality, protecting it from accidental manipulation.

#### What are Objects?

* Everything in Ruby is an object!
* Objects are created by classes-- objects are things, classes are the molds that produce them
  * Ex: `"hello".class` and `"word".class` will both return ```String```

#### Classes Define Objects

* Classes are basic outlines of what an object should be made of and what it should be able to do.

* Class definition uses similar syntax as method definition:

  * `def` is replaced with `class`, and CamelCase is used for the name (e.g. `MyNewClass`).
  * The reserved keyword `end` finishes the definition.

* Ruby filenames should be in snake_case, and reflect the class name. (`good_dog.rb`, class: `GoodDog` )

  ```Ruby
  class GoodDog
  end
  
  sparky = GoodDog.new
  ```
  * We create an instance of our `GoodDog` class and store it in the variable `sparky`.
  * `sparky` is an object or instance of class `GoodDog`

* The workflow of creating a new object or instance from a class is **instantiation**.

* Objects are returned by calling the class method `new`.

#### Modules

* Modules are a way of achieving **polymorphism** in Ruby.

* A **module** is a collection of behaviors that is usable in other classes via **mixins**.

  * Modules are mixed-in using the `include` method invocation.

* ```Ruby
  module Speak
    def speak(sound)
      puts sound
    end
  end
  
  class GoodDog
    include Speak
  end
  
  class HumanBeing
    include Speak
  end
  
  sparky = GoodDog.new
  sparky.speak("Arf!") # => Arf!
  bob = HumanBeing.new
  bob.speak("Hello!") # => Hello!
  ```

  * In the above code sample, both the `GoodDog` object (assigned to the variable `sparky`), and the `HumanBeing` object (assigned to the variable `bob`) have access to the `speak` instance method, because their classes have the `Speak` module mixed-in by using `include`.

#### Method Lookup

* Ruby has a distinct lookup path for methods that it follows each time a method is called.
  * Use the `ancestors` method on any class to find out the method lookup chain. 

```Ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
```

* Output of above:

  * ```Ruby 
    ---GoodDog ancestors---
    GoodDog
    Speak
    Object
    Kernel
    BasicObject
    ```

  * Since the `speak` method isn't defined in the `GoodDog` class, the next place Ruby looks is the `Speak` module, and so on down the list in an ordered, linear fashion.



##### Exercises

1. How do we create an object in Ruby? Give an example of the creation of an object.

   * We instantiate an object in Ruby by calling the class method `new` on a class. 

   * ```Ruby
     class Text
     end
     
     text_obj = Text.new
     text_obj.class # => Text
     ```

2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

   * Modules are collections of behaviors (methods) that can then be mixed-in to classes using the `include` keyword, allowing those classes access to the methods in the module.

   * ```Ruby
     module Say
       def say(msg)
         puts "#{msg}"
       end
     end
     
     class Text
       include Say
     end
     
     text_obj = Text.new
     text_obj.say("hello!")
     ```

## Classes and Objects I

#### States and Behaviors

* When defining a class, we typically focus on two things: *states* and *behaviors*
  * States: the tracking of attributes for individual objects (tracked in instance variables `@var`)
  * Behaviors: what objects are capable of doing (available as instance methods)

#### Initializing a New Object

* The `initialize` method in a class is called immediately whenever you create a new object.

  * ```Ruby
    class GoodDog
      def initialize
        puts "This object was initialized!"
      end
    end
    
    sparky = GoodDog.new # => "This object was initialized!"
    ```

  * Instantiating a new object with the `new` class method triggers the `initialize` instance method.

  * `initialize` is known as a *constructor*, because it is triggered whenever we create a new object.

#### Instance Variables

```Ruby
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
```

* the `initialize` method takes a parameter `name`
* our **instance variable** `@name` is set to the argument that is passed in to `initialize` through `new`
  * `@name == "Sparky"`
* Instance variables are how we keep track of each object's unique state

#### Instance Methods

#### Accessor Methods



## Classes and Objects II

#### Class Methods

#### Class Variables

#### Constants

#### The to_s Method

#### More About self



## Inheritance

#### Class Inheritance

#### super

#### Mixing in Modules

#### Inheritance vs. Modules

#### Method Lookup Path

#### More Modules

#### Private, Protected, and Public

#### Accidental Method Overriding