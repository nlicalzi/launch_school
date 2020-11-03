# Exercises from Inheritance section of OOP with Ruby book
# https://launchschool.com/books/oo_ruby/read/inheritance

module Towable
  def can_tow?(load)
    load < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :year, :color, :model, :speed

  @@fleet_count = 0

  def initialize(year, color, model)
    self.year = year
    self.color = color
    self.model = model
    self.speed = 0
    @@fleet_count += 1
  end

  def self.fleet_count
    "There are #{@@fleet_count} vehicles in our fleet."
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

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  def to_s
    "My car is a #{self.year} #{self.color} #{self.model}"
  end
end

class MyTruck < Vehicle
  include Towable

  def to_s
    "My truck is a #{self.year} #{self.color} #{self.model}"
  end
end

car = MyCar.new(1997, 'blue', 'toyota camry')
puts car

truck = MyTruck.new(2010, 'matte black', 'ford f150')
puts truck

puts "\nQ2 below:"
puts Vehicle.fleet_count # Q2

puts "\nQ3 below:"
puts truck.can_tow?(1500) # Q3

puts "\nQ4 below:"
puts "--- MyTruck's Ancestors ---"
puts MyTruck.ancestors

puts "\nQ5 below:"
puts truck.speed_up
puts car.slow_down

puts "\nQ6 below:"
puts truck.age
puts car.age


class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

puts "\nQ7 below:"
joe = Student.new("Joe", 97)
bob = Student.new("Bob", 85)
puts joe.better_grade_than?(bob)
puts joe.grade
