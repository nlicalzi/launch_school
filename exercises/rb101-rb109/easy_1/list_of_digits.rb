# Source: https://launchschool.com/exercises/30e147eb

# Q: Write a method that takes one argument, a positive integer, and returns a
#    list of the digits in the number.

def digits(input)
  verify_int(input).to_s.split(//)
end

def verify_int(input)
  raise ArgumentError, 'Input must be an integer' unless input.is_a? Integer
  raise ArgumentError, 'Input must be positive' unless input.positive?

  input
end

print digits(505050)

# P: Take an input (a positive integer), split it, and return an array where
#    each object is one of its digits. Return an error for any other type of
#    input.

# E: digits(123) => [1, 2, 3]
#    digits(1) => [1]
#    digits(-1) => ArgumentError, integer must be positive
#    digits(1.4) => TypeError, input must be an integer
#    digits('21341') => Type error, input must be an integer

# D: our input data structure is an integer
#    our output data structure is an array of integers

# A: Take an input
#    Check that it's a positive integer
#    Create an empty array 'split'
#    Convert integer to a string
#    Create a new array from split string
#    For each item in the split string, convert to int and append to 'split'
#    Return 'split'
