# Source: https://launchschool.com/exercises/d1cd145c

# Q: Create a method that takes two arguments, multiplies them together, and
# returns the result.

# Problem: Given inputs A and B, define a method that returns A*B

# Clarifying Questions:
#   Should we assume only valid numeric inputs?

# Data Structure:
#   In: 2 numeric inputs
#   Out: Numeric

# Algorithm:
#   Given the passed parameters: A, B
#   Return A * B

#Code:
def multiply(a, b)
  a * b
end

#Test Cases:
puts multiply(5, 3) == 15
puts multiply(0, 1) == 0
puts multiply(0.01, 2) == 0.02
puts multiply(0, 0) == 0
puts multiply([1, 2], 3) == [1, 2, 1, 2, 1, 2]
puts multiply('hey', 3) == 'heyheyhey'
