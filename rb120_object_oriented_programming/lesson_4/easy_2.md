### RB120/Lesson_4 Practice Problems: Easy 2

Souce: https://launchschool.com/lessons/f1c58be0/assignments/25448951



**Q1:**

That code snippet will return the string `"You will "`, concatenated with one of the string elements (randomly selected) in the array returned by calling `choices`



**Q2:**

That code will return the string `"You will "`, concatenated with one of the string elements (randomly selected) in the array returned by calling `RoadTrip.choices`, rather than `Oracle.choices`, since we have now overwritten the method call in the subclass.



**Q3:**

You can call `Class.ancestors` on a given object's class that to see the lookup path a given method will follow. (note: NOT an instance method unless custom implemented)

`Orange.ancestors` and `HotSauce.ancestors` will show their lookup chains.



**Q4:**

```Ruby
class BeesWax
  attr_accessor :type # removes verbose implementation of setter/getter
  
  def initialize(type)
    @type = type
  end
  
  def describe_type
    puts "I am a #{type} of Bees Wax" # type now calls method, instead of var
  end
end
```



**Q5:**

`excited_dog` is a local variable

`@excited_dog` is an instance variable

`@@excited_dog` is a class variable



**Q6:**

`def self.manufacturer; end` is a class method because the calling object is `self`, and it could be called using `Television.manufacturer`



**Q7:**

The `@@cats_count` class variable is incremented by 1 whenever a new `Cat` object is initialized. In order to test this theory, we could run the following code:

```Ruby
puts Cat.cats_count

tabby = Cat.new('Tabby')
puts Cat.cats_count

tuxedo = Cat.new('Tuxedo')
puts Cat.cats_count
```



**Q8:**

We would add `class Bingo < Game` to allow `Bingo` to inherit from superclass `Game`



**Q9:**

If we added `#play` to the `Bingo` class, it would override `Game#play` because `Bingo` is sooner in the method lookup chain



**Q10:**

Some benefits of using Object Oriented Programming in Ruby:

* Keeping code DRY (**D**on't **R**epeat **Y**ourself)
* Increased readability (can track things back to class definitions)
* Increased reusability (create objects from class template)
* Better able to debug, make changes, etc. in one place (manage complexity)
* Increased capacity for abstraction
* Protecting namespacing
* Easier to conceptualize