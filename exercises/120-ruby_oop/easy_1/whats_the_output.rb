# Source: https://launchschool.com/exercises/c1b97807

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name) # => Only calls #initialize and normal to_s
puts fluffy.name # => Calls 
puts fluffy # => Calls our to_s method, which mutates @name and name (same obj in memory)
puts fluffy.name # => result of calling our to_s method
puts name # => returns our mutated name var

