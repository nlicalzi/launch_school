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

```Ruby
class GoodDog
  def initialize(name)
    @name = name
  end
  
  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak # => "Sparky says arf!"

fido = GoodDog.new("Fido")
puts fido.speak # => "Fido says arf!"
```

* All objects of the same class have the same behaviors, but contain different states (here: `@name`)

#### Accessor Methods

```Ruby
puts sparky.name # => NoMethodError: undefined method `name`
```

* If we want to access the `@name` variable, we have to create a method that will return the name:

  * ```Ruby
    class GoodDog
      def initialize(name)
        @name = name
      end
      
      def name
        @name
      end
      
      def name=(name) # syntactic sugar w/ the equals sign `=`
        @name = name
      end
      
      def speak
        "#{@name} says arf!"
      end
    end
    
    sparky = GoodDog.new("Sparky")
    puts sparky.speak
    puts sparky.name
    puts sparky.name = "Spartacus"
    puts sparky.name
    ```

* In the above code, `name` is a **getter method**.

* In the above code, `name=(name)`is a **setter method**, with syntactic sugar

  * normally we'd have to call `sparky.name=('')`, instead we can do `sparky.name = ''`
  * method name is `name=`, with the string argument being passed in

* **getter** and **setter** methods use the same name as the instance variable they are exposing/setting

* **attr_acccesor** method simplifies the process of creating **getter** and **setter** methods:

  * ```Ruby
    class GoodDog
      attr_accessor :name
      
      def initialize(name)
        @name = name
      end
      
      def speak
        "#{@name} says arf!"
      end
    end
    
    sparky = GoodDog.new("Sparky")
    puts sparky.speak
    puts sparky.name # => "Sparky"
    sparky.name = "Spartacus"
    puts sparky.name # => "Spartacus"
    ```

* all of the `attr_*` methods take symbols as parameters: `attr_accessor :name, :height, :weight`

* Once we have `attr_accessor` active, we want to use their associated getter instance methods, rather than calling the instance variables themselves-- imagine the case of a social security number where you don't want to actually expose the underlying data.

  * ```Ruby
    # converts '123-45-6789' to 'xxx-xx-6789'
    'xxx-xx-' + @ssn.split('-').last # have to call this repeatedly
    
    # VERSUS
    
    def ssn # can just call the method
      # converts '123-45-6789' to 'xxx-xx-6789'
      'xxx-xx-' + @ssn.split('-').last 
    end
    ```

##### Calling methods with self:

* ```Ruby
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
  ```

  * using `self` tells Ruby that we're calling a setter method

  * can also be used for getter methods:

    * ```Ruby
      def info
        "#{self.name} weighs #{self.weight} and is #{self.height} tall."
      ```

* `self` can be used with any instance method, not just those included in `attr_accessor`

## Classes and Objects II

#### Class Methods

* **Class methods** are methods we can call directly on the class itself, without first instantiating objects.

* Class methods are defined by prepending the method name with the reserved word `self`:

  * ```Ruby
    def self.what_am_i # class method definition
      "I'm a GoodDog class!"
    end
    
    GoodDog.what_am_i # => I'm a GoodDog class!
    ```

* Class methods are where we put functionality that does not pertain to individual objects.

  * Individual objects contain state, class methods do not need to deal with state.

#### Class Variables

* We can also create variables for an entire class called **class variables** using `@@this_syntax`.

  * ```Ruby
    class GoodDog
      @@number_of_dogs = 0 # class var
      
      def initialize # on initialization of new object, increment class var
        @@number_of_dogs += 1
      end
      
      def self.total_number_of_dogs # class method, returns the class var
        @@number_of_dogs
      end
    end
    
    puts GoodDog.total_number_of_dogs # => 0
    dog1 = GoodDog.new
    dog2 = GoodDog.new
    puts GoodDog.total_number_of_dogs # => 2
    ```

#### Constants

* If you want to create a class varaiable that never changes, you can use a **constant**

  * Constants are clared in capslock, like this: `DOG_YEARS`

  * ```Ruby
    class GoodDog
      DOG_YEARS = 7
      
      attr_accessor :name,:age # able to "get" w/ methods obj.name || obj.age
      
      def initialize(n, a)
        self.name = n # setter method, var: @name
        self.age = a * DOG_YEARS # setter method, var: @age
      end
    end
    
    sparky = GoodDog.new("Sparky", 4)
    puts sparky.age # => 28
    ```

#### The to_s Method

* `#to_s` is called automatically on the object when we use it with `puts` or string interpolation
* `puts spark` is equivalent to `puts sparky.to_s`
* `p sparky` is equivalent to `puts sparky.inspect`

#### More About self

* Two clear use cases for `self`:
  * Use `self` when calling setter methods from within the class, allowing Ruby to disambiguate between initializing a local variable and calling a setter method.
  * Use `self` prepended to a method definition inside a class to define a **class method**.
    * `def self.a_method` is equivalent to `def GoodDog.a_method` (read: defined on the class)
* In other words:
  * `self`, inside an instance method, references the instance (object) that called the method (the calling object)
    * `self.weight=` is the same as `sparky.weight=`
  * `self`, outside of an instance method, references the class and can be used to define class methods.
    * `def self.name=(n)` is the same as `def GoodDog.name=(n)`

##### Chapter Summary

* Initializing objects with the `new` method
* How instance variables keep track of an object's state
* Learning how `attr_*` methods generate *getters* and *setters*
* Using instance methods to perform operations on our objects
* Using class methods to perform operations at the class level
* Assigning class variables to relate specifically to our class
* Assigning constants that never change to perform operations in our classes
* How the `to_s` method is used and that we've been using it implicitly all along
* How and when to use `self`

## Inheritance

* **Inheritance** is when a class `inherits` behavior from another class (using keyword `include`)
  * The class that is inheriting behavior is called the **subclass**
  * The class that it inherits from is called the **superclass**
  * We use inheritance as a way to extract common behaviors from classes that share the behavior and move it to a superclass, allowing us to keep logic in one place.

#### Class Inheritance

* Let's extract the `speak` method to superclass `Animal`, and use inheritance to make that behavior available to `GoodDog` and `Cat` classes.

  * `<` symbol below signifies that `GoodDog` and `Cat` classes are inheriting from `Animal` superclass.

  * Defining `speak` in a subclass that has also inherited `speak` from a superclass will **override** the `speak` method, because Ruby checks the object's class first before looking in the superclass.

    * Read more about **method lookup** paths later.

  * Take advantage of inheritance to adhere to **DRY**: don't repeat yourself

  * ```Ruby
    class Animal
      def speak
        "Hello!"
      end
    end
    
    class GoodDog < Animal
    end
    
    class Cat < Animal
    end
    
    sparky = GoodDog.new
    paws = Cat.new
    puts sparky.speak # => Hello!
    puts paws.speak 	# => Hello!
    ```

#### super

* Ruby's built-in function `super` allows us to call methods up the inheritance hierarchy.

  * When `super` is called within a method, it will search the instance hierarchy for a method by the same name, and then invoke it. 

  * ```Ruby
    class Animal
      def speak
        "Hello!"
      end
    end
    
    class GoodDog < Animal
      def speak
        super + " from GoodDog class" # returns value of Animal#speak + message
      end
    end
    
    animal = Animal.new
    sparky = GoodDog.new
    puts animal.speak # => "Hello!"
    puts sparky.speak # => "Hello! from GoodDog class"
    ```

  * ```Ruby
    class Animal
      attr_accessor :name # set & get
    
      def initialize(name)
        @name = name
      end
    end
    
    class GoodDog < Animal
      def initialize(color)
        super # passes argument (color) back to Animal#initialize, setting @name
        @color = color # sets obj.color to passed param
      end
    end
    
    animal = Animal.new('brown')
    bruno = GoodDog.new('brown')
    p animal # => @name="brown"
    p bruno # => @name="brown", @color="brown"
    ```

* When called with specific arguments (eg. `super(a, b)`) the specified arguments will be sent up the method lookup chain:

  * ```Ruby
    class BadDog < Animal
      def initialize(age, name)
        super(name)
        @age = age
      end
    end
    
    BadDog.new(2, "bear")
    ```

  * In the above example, when a `BadDog` object is created, the passed in `name` argument ('bear') is passed to the superclass and set to the `@name` instance variable.

#### Mixing in Modules

* Mixing in modules is another way to keep your code **DRY**. Consider the following example:

  * If we want to model the animal kingdom, we might start with a superclass `Animal`, with subclasses `Fish` and `Mammal`. `Mammal` class objects might have a `warm_blooded?` method that resolves to `True`, while `Fish` objects have a `swim` method available to them. However, what about a subclass `Dog`? That is a mammal, but it can also swim-- therefore we can create a `Swimming` module and mix it in to both the `Fish` class but also the `Dog` class (since they're mammals and not fish).

  * ```Ruby
    module Swimmable
      def swim
        "I'm swimming!"
      end
    end
    
    class Animal; end
    
    class Fish < Animal
      include Swimmable # mixing in Swimmable module
    end
    
    class Mammal < Animal
    end
    
    class Cat < Mammal
    end
    
    class Dog < Mammal
      include Swimmable # Mixing in Swimmable module
    end
    
    sparky = Dog.new  # initialize our dog object `sparky`
    neemo  = Fish.new # initialize our fish object `neemo`
    paws   = Cat.new  # initialize our cat object `paws`
    
    puts sparky.swim # => I'm swimming!
    puts neemo.swim  # => I'm swimming!
    puts paws.swim   # => NoMethodError
    ```

* A common naming convention for Ruby is to use the "-able" suffix on whatever verb describes the behavior that the module is modeling (think: `Enumerable`, or `Swimmable` above)

#### Inheritance vs. Modules

* Two primary ways that Ruby implements inheritance:
  * **Class inheritance**-- one type inherits the behaviors of another type.
  * **Interface inheritance**-- class inherits the interface provided by the mixin module.
* When to use class inheritance vs. mixins?
  * You can only subclass from one class, but you can mixin as many modules as you'd like.
  * "is-a" relationships: typically class inheritance || "has-a" relationships: typically mixins
    * ex. dog "is an" animal, while dog "has an" ability to swim

#### Method Lookup Path

* The **method lookup path** is the order in which classes are inspected when you call a method.
* Use the `ancestors` class method to see the path: `puts obj.ancestors`
* The order in which modules are `include`d is important: last module included comes first in the lookup.

#### More Modules

* One important usecase for modules is **namespacing**, or organizing similar classes under a module.

  * This allows us to group repated classes, and recognize them in our code

  * Also allows us to reduce the likelihood of classes colliding with other similarly named classes

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
    
    buddy = Mammal::Dog.new # Call classes in a module using `::`
    kitty = Mammal::Cat.new # Call classes in a module using `::`
    buddy.speak('Arf!')     # => "Arf!"
    kitty.say_name('kitty') # => "kitty"
    ```

* Another important use case is using modules as **containers** for methods (**module methods**).

  * ```Ruby
    module Mammal
      # ...
      def self.some_out_of_place_method(num)
        num ** 2
      end
    end
    
    value = Mammal.some_out_of_place_method(4) # call the method like this
    ```

#### Private, Protected, and Public

* A **public method** is a method that is avaiable to anyone who knows either the class or object's name.

  * These methods are readily available for the rest of the program to use, comprising the classes' **interface** (how other classes and objects will interact with this class and its objects, think *API*).

* A **private method** does work in the class, but doesn't need to be available to the rest of the program.

  * Defined using the `private` method call in our program (anything below it is private), but can be "capped off" (or negated) using `protected`.

  * Private methods are not accessible outside of the class definition at all, and are only accessible form inside the class when called without `self`.

  * Helps keep our namespace clean, by ensuring that only other methods inside the class can call that method.

  * ```Ruby
    class GoodDog
      DOG_YEARS = 7
    
      attr_accessor :name, :age
    
      def initialize(n, a)
        self.name = n
        self.age  = a
      end
    
      def public_disclosure # note that this is above the call to `private`
        "#{self.name} in human years is #{human_years}" # not self.human_years
      end
    
      private
    
      def human_years
        age * DOG_YEARS
      end
    end
    
    sparky = GoodDog.new("Sparky", 4)
    puts sparky.public_disclosure # => "Sparky in human years is 28"
    puts sparky.human_years # => NoMethodError: private method 'human_years' called for
    ```

* A **protected method** is created using the `protected` keyword.

  * from inside the class, `protected` methods are accessible just like `public` methods.

  * from outside the class, `protected` methods act just like `private` methods.

  * ```Ruby
    class Animal
      def a_public_method
        "Will this work? " + self.a_protected_method
      end
    
      protected
    
      def a_protected_method
        "Yes, I'm protected!"
      end
    end
    
    fido = Animal.new
    puts fido.a_public_method # => "Will this work? Yes, I'm protected!"
    puts fido.a_protected_method # => NoMethodError: protected method
    ```

#### Accidental Method Overriding

* Try not to override inherited methods from classes like `Object`! (everything in Ruby inherits from it).

