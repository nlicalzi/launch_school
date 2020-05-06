### Reconstructed Study Guide from Memory

**5/1/20**



* Classes and Objects

  * Classes are the template from which objects are created-- think of classes as a blueprint and the instance objects *instantiated* from the classes as the buildings.

  * ```Ruby
    class Cat
      def initialize(name)
        @name = name
      end
      
      def name
        @name
      end
    end
    
    bean = Cat.new('Bean')
    puts bean.name
    
    dexter = Cat.new('Dexter')
    puts dexter.name
    ```

* Use `attr_*` to create setter and getter methods / call setter & getter methods

  * There are 3 main ways to create & call setter and getter methods:

    * ```Ruby
      class Cat
        attr_reader :name  # individually call the attr_writer method and pass a symbol
        attr_writer :name  # individually call the attr_writer method and pass a symbol
      end
      
      kitten = Cat.new     # instantiate new Cat object and point `kitten` to it
      kitten.name = 'Bean' # invoke method defined by attr_writer to set `name`
      kitten.name					 # invoke method defined by attr_reader to return 'name'
      ```

    * ```Ruby
      class Cat
        attr_accessor :name # call the attr_accessor method and pass a symbol
      end
      
      kitten = Cat.new			# instantiate new Cat object and point `kitten` to it
      kitten.name = 'Bean'  # invoke method defined by attr_accessor to set `name`
      kitten.name           # invoke method defined by attr_accessor to return `name`
      ```

    * ```Ruby
      class Cat
        def name=(name) 	 # define a setter method `#name=`
          @name = name  	 # set instance variable `name` to arg passed to `name`
        end
        
        def name 					 # define a getter method `#name`
          @name						 # return the instance variable `name`
        end
      end
      
      kitten = Cat.new 		 # instantiate the new Cat object and point `kitten` to it
      kitten.name = 'Bean' # syntactic sugar results in this pretty looking invocation
      kitten.name					 # call our getter method
      ```

* Instance methods vs. class methods

  * Class methods are defined within a class by prepending `self.` to the method definition
  * Instance methods are defined normally within a class

* Referencing and setting instance variables vs. using getters and setters

* Class inheritance, encapsulation, and polymorphism

  * **Inheritance**:
  * **Encapsulation**:
  * **Polymorphism**: the ability to interact with

* 