# Exercises from Classes and Objects II section of OOP with Ruby book
# https://launchschool.com/books/oo_ruby/read/classes_and_objects_part2

class MyCar
  attr_accessor :year, :color, :model, :speed
  attr_reader :color
  def initialize(year, color, model)
    self.year = year
    self.color = color
    self.model = model
    self.speed = 0
  end

  def speed_up
    self.speed += 10
    puts "We're speeding up! Going #{self.speed}mph now!"
  end

  def slow_down
    self.speed -= 10
    puts "We're slowing down! Going #{self.speed}mph now!"
  end

  def shut_off
    self.speed = 0
    puts "That's enough driving for now. Bringing it down to #{self.speed}mph."
  end

  def spray_paint(paint_color)
    self.color = paint_color
  end

  def to_s
    "My car is a #{self.year} #{self.color} #{self.model}"
  end

  def self.gas_mileage(gallons, distance)
    "#{distance / gallons} miles per gallon"
  end
end

car = MyCar.new(1997, 'blue', 'toyota camry')
puts car
puts MyCar.gas_mileage(100, 10_000)

class Person
  attr_accessor :name # setter and getter enabled
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
