### RB120/Lesson_4 Practice Problems: Medium 1

Source: https://launchschool.com/lessons/f1c58be0/assignments/652f8d69



**Q1:**

Ben is correct. `balance` on line 9 is actually calling the getter method `#balance` defined with the `attr_reader` on line 2, and returning the value of the `@balance` instance variable, so no `@` is necessary. 



**Q2:**

The code will fail because line 11 refers to `quantity`, but there is no setter method defined, only a getter method. The code can be fixed by adding `attr_writer :quantity` to the top, or changing `quantity` to `@quantity`.



**Q3:**

It would work, but allowing updates through `instance.var = <new_val>` allows for the circumvention of any safeguards you might have had in your `#update_var` method-- guard clauses, conditionals, etc. and so is generally avoided. Better to use your custom method!



**Q4:**

```Ruby
class Greeting
  def greet(msg)
    puts msg
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```



**Q5:**

```Ruby
class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing

    @filling_type = "Plain" unless filling_type
  end

  def to_s
    glazing == nil ?  "#{filling_type}" : "#{filling_type} with #{glazing}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5
```



**Q6:**

Generally we should avoid using `self` unless we need it-- both pieces of code function the same, but one is cleaner (the first one).



**Q7:**

We could change the method defined on lines 9-11 to `self.information`, since we would call it as `Light::information` instead of `Light::light_information` (repetitive)