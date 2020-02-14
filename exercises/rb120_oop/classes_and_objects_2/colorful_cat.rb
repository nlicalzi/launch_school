# Source: https://launchschool.com/exercises/5835e7ee

class Cat
  COLOR = "tabby"

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
