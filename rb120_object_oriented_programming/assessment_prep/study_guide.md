## RB129 Study Guide

#### Outline

1. Classes and objects

   * Anything in Ruby **that can have a value** is an object.

     * Is a method an object? Is a block an object? (no)

   * Classes are blueprints from which object instances of that class are constructed.

     * We can think of objects as "encapsulations of state and behavior": behaviors are defined in the class and are available to all object instances of that class, while each object's state tracks its attributes, is unique, and is initialized along with the object at the time of instantiation. The object's behaviors make up its **interface**, or how we can interact with it and its state from outside the object.

     * ```Ruby
       class Animal; end # class definition
       
       kitten = Animal.new # instantiation of a new Animal object, and pointing the local variable `kitten` at it
       ```

   * What method can we call to see the class an object was instantiated from?

     * ```Object#class```

2. Use ```attr_*``` to create setter and getter methods

   * Setter and getter methods represent ways of interacting with an object's **state**-- either retrieving and returning or outputting some information (**getting**) or setting/overwriting some information (**setting**).
   * `attr_*` setters and getters are defined at the top of a class, by invoking some specific methods: `attr_writer` for a setter, `attr_reader` for a getter, or `attr_accessor` for defining both at once. Each of those methods can take more than one argument, passed in as a symbol (ex. `:name`), which then defines the associated methods for you as either `def name` or `def name=`

3. How to call setters and getters

   * Ruby has built in syntactic sugar specifically for calling setter methods, which are either defined by invoking the `attr_writer / attr_accessor` methods or by defining a method like so: `def name=(first_name); @name = first_name; end`. Instead of invoking the method as `obj.name=('nick')`, the syntactic sugar allows us to call it as `student.name = 'nick'`, a much prettier way to do it!

   * ```Ruby
     class Person
       attr_accessor :name, :age # defining setters and getters for both name and age
       
       def initialize(name, age) # defining our constructor method
         @name = name
         @age = age
       end
       
       def greeting
         "Hi! My name is #{name} and I'm #{age} years old." # using our getter methods
       end
     end
     
     student = Person.new("Nick", 27)
     
     puts student.greeting
     
     student.name = 'Nicole' # what if the student changes their name?
     student.age = 28        # what about after their birthday passes?
     
     puts student.greeting
     ```

4. Instance methods vs. class methods

5. Referencing and setting instance variables vs. using getters and setters

6. Class inheritance, encapsulation, and polymorphism

7. Modules

8. Method lookup path

   1. ```Class.ancestors``` or ```object.class.ancestors```
   2. Ruby looks at the last module that we included first, and modules mixed into superclasses are included in subclasses.

9. ```self```

   1. Calling methods with ```self```

      1. ```Ruby
         ## Use `self` when calling setter methods from within the class
         def change_info(n, h, w)
           self.name = n # using self tells ruby we're calling the setter method
           self.height = h
           self.weight = w
         end
         ```

      2. ```Ruby
         ## Use `self` for class method definitions
         class GoodDog
           # ... rest of code omitted for brevity
           def info
             "#{self.name} weighs #{self.weight} and is #{self.height} tall"
           end
           def some_method
             self.info # Calls the instance method, not an attr_* method
           end
         end
         ```

   2. More about ```self```

      1. From within a class, `self`, inside of an instance method, references the instance (object) that called the method-- the calling object. Therefore `self.weight=` is the same as `sparky.weight=` in our example.
      2. From within a class, `self`, outside of an instance method, references the class and can be used to define class methods. Therefore `def self.name=(n)` is the same as `def GoodDog.name=(n)` in our example.

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

  * Two primary ways in which Ruby implements inheritance:

    * `Class inheritance`: one type inherits the behaviors of another type
      * Generally used to model "is-a" relationships
      * A cat "is a" mammal
    * `Interface inheritance`: a class inherits the interface provided by another.
      * Generally used to model "has-a" relationship.
      * Dogs "have an" ability to swim

  * Class inheritance allows you to override methods in `subclasses` that were defined in the `superclasses`, this is one way of implementing **polymorphism**

  * ```Ruby
    class Animal
      def speak
        "Hello!"
      end
    end
    
    class GoodDog < Animal; end
    
    sparky = GoodDog.new
    puts sparky.speak # => Sparky says arf!
    ```

* **Superclass**

  * The class from which behavior is inherited by a ```subclass```
  * Usually more basic classes with large reusability

* **Subclass**

  * The class that inherits behavior from a ```superclass```
  * Smaller classes with more fine-grained/detailed behaviors

* **Module**

  * A collection of behaviors that is usable in other classes via ```mixins```

  * ```mixin``` a module to a class using the ```include``` method invocation

  * Naming convention: use suffix "-able" on whatever verb describes the behavior that the module is modeling (ex. `Enumerable`)

  * ```Ruby
    module Swimmable
      def swim
        "I'm swimming!"
      end
    end
    
    class Animal; end
    
    class Fish < Animal
      include Swimmable # mix in Swimmable module
    end
    
    class Mammal < Animal; end
    class Cat < Mammal; end
    
    class Dog < Mammal
      include Swimmable # mix it in again here
    end
    
    sparky = Dog.new
    neemo = Fish.new
    paws = Cat.new
    
    sparky.swim # => I'm swimming!
    neemo.swim  # => I'm swimming!
    paws.swim   # => NoMethodError: undefined method
    ```

  * Useful for **namespacing**-- organizing similar classes under a module

    * ```Ruby
      module Mammal
        class Dog
          def speak(sound)
            p "#{sound}"
          end
        end
        
        class Cat
          def say_name(name)
            p "#{name}"
          end
        end
      end
      
      buddy = Mammal::Dog.new
      kitty = Mammal::Cat.new
      buddy.speak('Arf!')       # => "Arf!"
      kitty.say_name('kitty')   # => "kitty"
      ```

  * Useful as a **container**-- using modules to house methods

    * ```Ruby
      module Mammal
        def self.some_out_of_place_method(num)
          num ** 2
        end
      end
      
      value = Mammal.some_out_of_place_method(4)
      ```

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

* **Class Variable**

  * Class variables are created using two `@` symbols like so: `@@var`

  * ```Ruby
    class GoodDog
      @@number_of_dogs = 0
      
      def initialize
        @@number_of_dogs += 1
      end
      
      def self.total_number_of_dogs # class method
        @@number_of_dogs
      end
    end
    
    puts GoodDog.total_number_of_dogs # => 0
    
    dog1 = GoodDog.new # @@number_of_dogs += 1
    dog2 = GoodDog.new # @@number_of_dogs += 1
    
    puts GoodDog.total_number_of_dogs # => 2
    ```

* **Constants**

  * Variables that will remain unchanged, often in the context of class creation.

  * Constants are defined by using UPPERCASE letters for the variable name and come at the top of the class definition.

  * ```Ruby
    class GoodDog
      DOG_YEARS = 7
      
      attr_accessor :name, :age
      
      def initialize(n, a)
        self.name = n
        self.age = a * DOG_YEARS
      end
    end
    
    sparky = GoodDog.new("Sparky", 4)
    puts sparky.age # => 28
    ```

* **to_s**

  * The `puts` method automatically calls `to_s` on its argument, and `to_s` can be overwritten within the custom class you are implementing to output a specifically formatted representation of your object.

    * `puts sparky` is equivalent to `puts sparky.to_s`
    * **IMPORTANT**: `p` doesn't work this way: `p sparky` is equivalent to `puts sparky.inspect`
    * Note: if the object is an array, calling `puts` will call `to_s` on each element in the array

  * ```Ruby
    def to_s
      "This dog's name is #{name} and it is #{age} in dog years."
    end
    
    puts sparky # => "This dog's name is Sparky and is 28 in dog years."
    ```

* **super**

  * `super` is a built in function that allows us to call methods further up the inheritance hierarchy. 

  * ```Ruby
    class Animal
      def speak
        "Hello!"
      end
    end
    
    class GoodDog < Animal
      def speak
        super + " from GoodDog class"
      end
    end
    
    sparky = GoodDog.new
    sparky.speak # => "Hello! from GoodDog class"
    ```

  * ```Ruby
    class Animal
      attr_accessor :name
      
      def initialize(name)
        @name = name
      end
    end
    
    class GoodDog < Animal
      def initialize(age, name)
        super(name) # calling super with a specific arg sends that arg up the chain
        @age = age
      end
    end
    
    bear = GoodDog.new(2, "bear")
    ```

* **Private / Protected / Public**

  * **Public methods** are available to anyone who knows either the class or object's name.
    * These methods comprise the class's **interface**
  * **Private methods** do work in the class, but aren't available outside of it
  * **Protected methods** are available to other objects of the same class, and therefore behave like `public methods`, but from outside of the class they behave like `private methods`. 
    * Protected methods are often used for comparison of objects

* **Collaborator Objects**

  * Objects that are stored as state within another object (i.e. local variable, etc)

* **Truthiness**

  * .

* **Fake operators**

  * Syntax that it looks like it might / should be an operator, but is actually a method call. 
  * Real operators: `&&`, `.. / ...`, `? :`, `=, %=, /=, -=, +=`
  * Everything else is actually a method and can be overwritten
    * `[], []=`, `**`, `!, ~ `, `*, /, %`, `+, - `, `<<, >>`, `<=>, ==, ===, !=`
  * Two of the most commonly overwritten fake operators are  `==` and `<=>`
    * Defining `==` automatically implements `!=` as well
    * Might use `==` and `<=>` to implement comparison of Person objects by their age-- `puts "bob is older than kim" if bob > kim`

* **The `==` Method**

  * this is a method, not an operator-- actual form is `#==(other)`

  * If you need to compare custom objects, you should override the `#==` method

  * ```Ruby
    class Person
      attr_accessor :name
      
      def ==(other)
        name == other.name # using String#== here inside our custom #==
      end
    end
    ```

  * 