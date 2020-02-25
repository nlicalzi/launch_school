### RB120/Lesson_4 Practice Problems: Easy 3

Source: https://launchschool.com/lessons/f1c58be0/assignments/98073b61



**Q1:**

* Case 1: `hello.hi` calls `Greeting#greet`, and outputs `"Hello"`
* Case 2: undefined method
* Case 3: ArgumentError
* Case 4: outputs `"Goodbye"`
* Case 5: `#hi` is an instance, not class, method, => undefined method



**Q2:**

changing `def hi` to `def self.hi` would make `Hello.hi` properly call the method as a class method, as long as we initialized a new `Greeting` object and used it to call `#greet`



**Q3:**

```ruby
dexter = AngryCat.new(10, "dexter")
bean = AngryCat.new(2, "bean")
```



**Q4:**

```Ruby
attr_reader :type

def to_s
  "I am a #{type} cat"
end
```



**Q5:**

The `tv` object can call `Television#model`, but not `Television::manufacturer`, while the `Television` can call `Television::manufacturer` but not `Television#model`.



**Q6:**

Change `self.age += 1` to `@age +=1`, because we have our `attr_accessor` set up



**Q7:**

The `return` on line 10 is useless, because the last line in a method is implicitly returned anyway.