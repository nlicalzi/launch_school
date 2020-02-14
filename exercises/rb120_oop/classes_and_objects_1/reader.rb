# Source: https://launchschool.com/exercises/18da9ce6

class Cat

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
