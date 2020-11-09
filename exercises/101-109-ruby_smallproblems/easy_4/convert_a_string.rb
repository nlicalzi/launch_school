# Source: https://launchschool.com/exercises/192719a5

STR_CONVERT = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}.freeze # We freeze this because it's a mutable object assigned to a constant

def string_to_integer(input)
  out = 0
  input.chars.each { |x| out = (out * 10) + STR_CONVERT[x] }
  out
end

# P:
#   Question:
#     Write a method that takes a String of digits, and returns the appropriate
#     number as an integer.
#   Rules/Reqs:
#     Do not use String#to_i, Integer(), etc.
#     All characters will be numeric (don't worry about + - etc)
#     Do not use any of the standard conversion methods in Ruby
#   IO:
#     In: String of digits
#     Out: Integer
#   Mental Model:
#     Write a method that reads in each digit element in a number string and
#     outputs an integer representation of the same number (no conversion methods)

# E:
#   Test Cases:
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

# D:
#   Structure: Array, lookup hash
