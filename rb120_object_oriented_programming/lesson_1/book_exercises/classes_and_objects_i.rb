# Exercises from Classes and Objects I section of OOP with Ruby book
# https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1

# 1. Create a class called MyCar. When you initialize a new instance or object
# of the class, allow the user to define some instance variables that tell us
# the year, color, and model of the car. Create an instance variable that is
# set to 0 during instantiation of the object to track the current speed of
# the car as well. Create instance methods that allow the car to speed up,
# brake, and shut the car off.

class MyCar
  attr_accessor :year, :color, :model, :speed
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up
    self.speed += 10
  end

  def slow_down
    self.speed -= 10
  end

  def shut_off
    self.speed = 0
  end

  def info
    "My car is a #{self.year} #{self.color} #{self.model}"
  end
end

mazda = MyCar.new(1996, 'blue', 'miata')
puts mazda.info
mazda.speed_up
mazda.speed_up
puts mazda.speed # => 20
mazda.shut_off
puts mazda.speed # => 0
