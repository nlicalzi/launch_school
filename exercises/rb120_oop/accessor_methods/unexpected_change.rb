# Source: https://launchschool.com/exercises/dc12d4a4

class Person
  def name=(name)
    @first_name, @last_name = name.split
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
