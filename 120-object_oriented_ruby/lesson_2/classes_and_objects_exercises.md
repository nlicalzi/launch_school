## Lecture: Classes and Objects

**Q1**: Given the below usage of the `Person` class, code the class definition

```Ruby
bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
```

**A1**:

```Ruby
class Person
  attr_accessor :name # one getter/setter
  
  def initialize(name)
    @name = name
  end
end
```



**Q2**: Modify the class definition from above to facilitate the following methods.

```Ruby
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
```

**A2**: 

```Ruby
class Person
  attr_accessor :first_name, :last_name # two getters/setters

  def initialize(full_name)
    parts = full_name.split # split the name into an array on ' '
    @first_name = parts.first # array will be of length 1 or greater
    @last_name = parts.size > 1 ? parts.last : '' # return last item in array or blank
  end

  def name
    "#{first_name} #{last_name}".strip # strip in case no last name present
  end
end
```



**Q3**: Now create a smart `name=` method that can take just a first name or a full name, and knows how to set the `first_name` and `last_name` appropriately.

```Ruby
class Person
  attr_accessor :name, :first_name, :last_name # two getters/setters

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip # strip in case no last name present
  end

  def name=(full_name)
    parse_full_name(full_name)
  end
  
  def to_s
    name # because puts calls `to_s` to output the class
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split # split the name into an array on ' '
    self.first_name = parts.first # array will be of length 1 or greater
    self.last_name = parts.size > 1 ? parts.last : '' # last item in array or blank
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
```



**Q4**: Using the class definition from step #3, let's create a few more people -- that is, `Person` objects.

```Ruby
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
```

If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

**A4**: `bob.name == rob.name`