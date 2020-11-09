# Source: https://launchschool.com/exercises/91ee1dc4

class Person
  def age=(age) # setter method
    @age = age * 2
  end

  def age # getter method
    @age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age
