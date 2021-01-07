# Source: https://launchschool.com/exercises/b161d835

# Q: Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power. Do not worry about
# validating the input.

# Problem:
#   Prompt user to input two integers a and b (assumed to be valid). For each of
#   the following operations (+, -, *, /, %, **), print the operation result for
#   the given integers.

# Clarifying Questions:
#   Can we assume inputs are positive integers?
#     What if the second input is 0? (We will be dividing by zero)

# Data Structure:
#   In: Int(a), Int(b)
#   Out: Strings

# Algorithm:
#   Request user input for integer a
#   Request user input for integer b
#   For each operation in %w(+ - * / % **)
#     Evaluate and display 'a operation b'

# Code:
puts 'Please enter the first integer: '
a = gets.chomp.to_i

puts 'Please enter the second integer: '
b = gets.chomp.to_i

%w(+ - * / % **).each do |operation|
  equation = "#{a} #{operation} #{b}"
  puts(equation + ' = ' + eval(equation).to_s)
end

# Test Cases:
