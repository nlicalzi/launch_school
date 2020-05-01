## Notes on RB120 Quizzes



* What problems led to the creation of OOP?
  * Large, complex programs can be **difficult to maintain** due to dependencies throughout the program. OOP lets programmers write programs in which the different parts of the program interact, thus **reducing dependencies** and **facilitating maintenance**.
  * Coding in a non-OO way often means writing code that is useful solely within a single context. Defining basic classes and leveraging concepts like **inheritance** to introduce more detailed behaviors provides a greater level of **reusability** and **flexibility**.
  * Complex coding problems are often difficult to break down and solve in a **clear and systematic** way. Using OOP to model classes appropriate to the problem, and using real-world nouns to represent objects, lets programmers think at a **higher level of abstraction** that helps them break down and solve problems.
* What statements can we make about the relationship between classes and objects in Ruby?
  * Classes act as *molds* or *templates* for objects.
  * An object's class determines its *behaviors* and *attributes*.
  * Objects are *instances* of a class.
  * Objects **do not** *inherit* methods from their class. *Inheritance* occurs between subclasses and superclasses only.
* What can we use to provide a collection of behaviors to one or more classes?
  * A **mixin module**.
* What is an alternative to class inheritance for sharing methods?
  * Using **mixin modules**.
* Can objects be instantiated from a module in Ruby?
  * No, objects can only be instantiated from *classes*.
  * Modules share **behaviors**, not **attributes**.
* How does Ruby accomplish **encapsulation**?
  * By creating objects and exposing interfaces (i.e. methods) to interact with them
* What is the purpose of **encapsulation**?
  * Encapsulation hides funcionality and makes it unavailable to the rest of the code base.
* What is **polymorphism**?
  * Polymorphism is the ability to represent data as different types.
* What is are some ways Ruby implements **polymorphism**?
  * Method overriding

* What methods do we have to share common behaviors between classes?

  * **Mixin modules** and **inheritance**

* What Ruby keyword can we use to call methods further up the inheritance hierarchy?

  * `super`

* How many classes can a given class in Ruby **subclass** from?

  * Only one class-- Ruby doesn't support *multiple inheritance*

* What are the ways we can implement getter and setter methods for `name`?

  * `attr_accessor :name`

  * `attr_reader :name` & `attr_writer :name`

  * ```Ruby
    def name=(name)
      @name = name
    end
    
    def name
      @name
    end
    ```

* Do both of the following methods successfully reassign `@grade`? Why?

  * ```Ruby
    def change_grade(new_grade)
      @grade = new_grade
    end
    
    def change_grade(new_grade)
      self.grade = new_grade # self.var is same as @var (inside method)
    end
    
    # self, when included outside of an instance method, references the class
    ```

* What is the following code snippet an example of?

  * ```Ruby
    class FarmAnimal
      def speak
        "#{self.class} says "
      end
    end
    
    class Sheep < FarmAnimal
      def speak
        super + "baa!"
      end
    end
    
    class Cow < FarmAnimal
      def speak
        super + "moo!"
      end
    end
    
    puts Sheep.new.speak
    puts Cow.new.speak
    ```

* What is a **collaborator object** in Ruby?

  * An object that is assigned to an instance variable in another object.

* What operators in Ruby are actually operators, and which are methods that can be overwritten?

  * Real operators: `&&`, `||`, 
  * Overrideable: `==`, `[]=`, `> / <`

* How can we check to see if two variables point to the same object?

  * `var1.object_id == var2.object_id`
  * Depends on object class-- `str1.equal?(str2)`

* What does `String#<=>` return if both compared strings are the same?

  * `0`. Would return `-1` if left side was greater, or `1` if right side.

* Is `#>` automatically implemented if we define `#<`? How about `#==` and `#!=`?

  * No, and yes.

* What is the difference between `Range#===` and `Integer#===`?

  * `Range#===` is used to compare a `Range` to an `Instance`
  * `Integer#===` is used to compare two instances of `Integer`

* What is the **public interface** of a class?

  * The methods exposed by the class to interact with objects of that class.
  * The **behaviors** and **attributes** of a class-- externally facing.