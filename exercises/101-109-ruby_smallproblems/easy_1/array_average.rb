# Source: https://launchschool.com/exercises/5b9a3e04

# Q: Write a method that takes one argument, an array containing integers, and
#    returns the average of all numbers in the array. The array will never be
#    empty and the numbers will always be positive integers.

def average(input)
  input.sum / input.size
  # input.sum.to_f / input.size # further exploration
end

# P: Assuming a non-empty array of positive integers, return the average of its
#    elements.

# E:
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# D: in: Array of positive integers
#    out: Integer

# A: Divide sum of array elements by length of array and return
