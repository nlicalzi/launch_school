# Source: https://launchschool.com/exercises/84376930

# Q: Build a program that randomly generates and prints Teddy's age.
#     To get the age, you should generate a random number between 20 and 200.

def display_age
  puts '=> Please enter your name below...'
  name = gets.chomp.downcase.capitalize

  name = 'Teddy' if name.length.zero?

  age = rand(20..200)

  puts "#{name} is #{age} years old!"
end

display_age

# P: Generate and print a random integer age, such that age >= 20 && age <= 200.
#
# E: Difficult to do for this one...
#
# D:
#   in: method call (no input required)
#   out: int
#
# A: Generate a random integer, between 20 and 200
#     Print "Teddy is #{age} years old!"
