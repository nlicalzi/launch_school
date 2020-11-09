# Source: https://launchschool.com/exercises/0049ac13

# Q: Write a method that takes one argument, a positive integer, and returns the
#    sum of its digits. For a challenge, try writing this without any basic
#    looping constructs (while, until, loop, and each).

def sum(input)
  arr = input.to_s.chars.map { |x| x.to_i }
  arr.reduce { |sum, num| sum + num }
  # number.to_s.chars.map(&:to_i).reduce(:+) # read up on symbols and procs
end

# P: Without looping, split a positive int into its digits and return their sum

# E:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# D: in: Positive integer
#    out: Positive integer

# A: Read in an integer, convert to string, split, convert to i, and return sum
