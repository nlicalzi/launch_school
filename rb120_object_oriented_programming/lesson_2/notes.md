## RB120 Lesson 2 Notes

* What is the difference between #p and #puts in the context of printing a class object/instance?
  
  * We can use #p to print the object so that #inspect is called, which lets us view the instance variables and their values along with the object.
  
* Every class has a `#to_s` method. `puts` calls `#to_s` method for every argument it gets passed to convert the value to an appropriate string representation. Knowing this, we can override `#to_s` for any class to produce any useful output we need.

* Protected methods are very similar to private methods. The main difference between them is protected methods allow access between class instances, while private methods don't. If a method is protected, it can't be invoked from outside the class. This allows for controlled access, but wider access between class instances.

* Method look up path: definition and why it matters (`::Ancestors`)

* using `#super` to look through inheritance hierarchy from inside a method

  * passing arguments to super (https://launchschool.com/exercises/2a89824f)
  * invoke w/ empty parens to pass no args `super()`: https://launchschool.com/exercises/a69454cc

* When a module is included in a class, the class is searched before the module, but the module is searched before the superclass.

* How do we instantiate a class that's contained in a module?

  * ```Ruby
    Module::Class.new
    ```

  * https://launchschool.com/exercises/507a7449

* What is **Polymorphism**?

  * The ability of different objects to respond in different ways to the same message (or method invocation).

  * Can be implemented through inheritance and duck typing:

  * ```Ruby
    ## INHERITANCE-- class lookups
    class Animal
      def eat
        "Yummy! I'm an animal and I'm eating this up."
      end
    end
    
    class Fish < Animal
      def eat
        'Nibbling at my food pellets!'
      end
    end
    
    class Cat < Animal
      def eat
        'Canned tuna! My favorite!'
      end
    end
    
    def feed_animal(animal)
      puts animal.eat
    end
    
    array_of_animals = [Animal.new, Fish.new, Cat.new]
    
    array_of_animals.each do |animal|
      feed_animal(animal)
    end
    ```

  * ```Ruby
    ## DUCK TYPING-- what methods are available (quacks like a duck?)
    class Wedding
      attr_accessor :guests, :flowers, :songs
    
      def prepare(preparers)
        preparers.each do |preparer|
          preparer.prepare_wedding(self)
        end
      end
    end
    
    class Chef
      def prepare_wedding(wedding)
        prepare_food(wedding.guests)
      end
    
      def prepare_food(guests)
        # implementation
      end
    end
    
    class Decorator
      def prepare_wedding(wedding)
        decorate_place(wedding.flowers)
      end
    
      def decorate_place(flowers)
        # implementation
      end
    end
    
    class Musician
      def prepare_wedding(wedding)
        prepare_performance(wedding.songs)
      end
    
      def prepare_performance
        # implementation
      end
    end
    ```

* What is **encapsulation**?

  * Encapsulation lets us hide the internal representation of an object from the outside, only exposing the methods and properties that users of the object need through (its public methods).

  * ```Ruby
    class Dog
      attr_reader :nickname
    
      def initialize(n)
        @nickname = n
      end
    
      def change_nickname(n)
        self.nickname = n # use self when calling private setter methods
      end
    
      def greeting
        "#{nickname.capitalize} says Woof Woof!"
      end
    
      private
        attr_writer :nickname
    end
    
    dog = Dog.new("rex")
    dog.change_nickname("barney")
    puts dog.greeting
    ```

    