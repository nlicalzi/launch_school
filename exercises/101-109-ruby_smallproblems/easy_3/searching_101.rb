# Source: https://launchschool.com/exercises/f4f25695

# Q: Write a program that solicits 6 numbers from a user, then prints a message
# describing whether or not the 6th number appears amongst the first 5 numbers.

# Problem:
#   Prompt the user to input 6 numbers, one at a time. Display a string stating
#   whether the final number is also one of the first five, and list them.
# Clarifying Questions:
#   Can we assume the inputs are valid numbers?
#   Can we assume the inputted numbers are positive?
#   Should the inputs be solely integers or floats also?

# Data Structure:
#   Input: Array
#   Output: String

# Algorithm:
#   Initiate 'input_nums' array
#   Initiate 'counter' at 0
#   Loop
#     Request that user input a number 'input'
#     Append 'input' to 'input_nums'
#     Increment 'counter'
#     Break if 'counter' == 5
#   End
#   Set 'last_num' to input_nums.pop
#   Check if any object in 'input_nums' == 'last_num'
#     If yes: 'out_str' = 'appears'
#     If no: 'out_str' = 'does not appear'
#   Return "The number #{last_num} #{out_str} in #{input_nums}"

# Code:

SUFFIX = { 0 => '1st', 1 => '2nd', 2 => '3rd',
           3 => '4th', 4 => '5th', 5 => 'last' }.freeze

input_nums = []
counter = 0

loop do
  puts "Please enter the #{SUFFIX[counter]} number:"
  input = gets.chomp.to_i
  input_nums << input
  counter += 1
  break if counter == 6
end

last_num = input_nums.pop

out_str = input_nums.any? { |x| x == last_num } ? 'appears' : 'does not appear'

p "The number #{last_num} #{out_str} in #{input_nums}"

# Test Cases:
