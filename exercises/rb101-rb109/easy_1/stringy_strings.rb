# Source: https://launchschool.com/exercises/f37a9e56

# Q: Write a method that takes one argument, a positive integer, and returns a
#    string of alternating 1s and 0s, always starting with 1. The length of the
#    string should match the given integer.

def stringy(int)
  case
  when int.even?
    return '10' * (int/2)
  when int.odd?
    return '10' * (int/2) + '1'
  end
end

# P: Take a positive integer and return a string, starting with '1', of '1' and '0'
#    that is the length of the passed integer.

# E: (All below should resolve to `true`)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# D: in: Integer
#    out: String

# A: Receive a positive integer
#    Create a new string, repeating '10' times integer/2
#    Append '1' if integer % 2 == 1
#    return string
