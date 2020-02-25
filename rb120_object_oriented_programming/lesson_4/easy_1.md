## RB120/Lesson_4/Practice Problems: Easy 1

*Source*: https://launchschool.com/lessons/f1c58be0/assignments/a5cfd2ae



**Q1: **

All of them are objects. You can find the class any object belongs to by calling `object.class`.



**Q2:**

```Ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

puts Truck.new.go_fast
puts Car.new.go_fast
```



**Q3:**

We use string interpolation, which automatically calls `to_s` on objects that are passed in, so `self.class` returns our class name in a readable format.



**Q4:**

`cat = AngryCat.new`



**Q5**:

`Pizza` contains an instance variable (`@name`), which is initialized and assigned to the argument that is passed in to the `initialize` method.

You can check to see what instance variables an object has assigned to it by calling `#instance_variables` on it. 



**Q6:**

We could either add a verbose getter method or include `attr_reader :volume`



**Q7:**

The default return value of `to_s` when called on an object is the object's name and encoded object id. This is findable in the Ruby documentation at ruby-doc.org as `Object#to_s`



**Q8:**

`self` in this context refers to the Cat instance that called the instance method `make_one_year_older`, and increments its instance variable `@age` by 1 using the setter method `#age` that we defined with the `attr_accessor`.



**Q9:**

`self` in this context refers to the `Cat` class, so `Cat.cats_count` will return the value of the `@@cats_count` class variable, which is incremented by 1 any time a new `Cat` instance is initialized



**Q10:**

To create a new instance of `Bag`, you would have to call `Bag.new(color, material)` and pass in values for those two parameter spaces

