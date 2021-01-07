# Source: https://launchschool.com/exercises/ae80cee3

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.dup # prevent mutation on the original instance var val
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name
