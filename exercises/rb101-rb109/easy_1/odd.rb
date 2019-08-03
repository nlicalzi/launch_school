# Source: https://launchschool.com/exercises/dfa7db2c

# Q: Write a method that takes one integer argument, which may be positive,
#   negative, or zero. This method returns true if the number's absolute value
#   is odd. You may assume that the argument is a valid integer value. Do not
#   use #odd? or #even? in the answer.

def odd_num?(num)
  num % 2 == 1
end

print odd_num?(3)

# P: Write a method that takes an integer, and returns true if the integer's
#    absolute value is odd. We can assume that the argument is a valid integer.
#    #odd? and #even? are off-limits.

# E: Since positive and negative integers (and 0) are allowed, and we can assume
#    that the integer is valid, then test cases are less necessary...
#    odd_num?(5) => true
#    odd_num?(4) => false
#    odd_num?(0) => false
#    odd_num?(-1) => true

# D: Our input value is an integer
#    Our output value is a boolean

# A: We ingest the integer (which is assumed to be valid)
#    Divide by two, if remainder is 1, number is odd (positive and 0 => false)
