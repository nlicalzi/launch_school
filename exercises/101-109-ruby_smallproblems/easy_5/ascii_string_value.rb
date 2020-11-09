# Source: https://launchschool.com/exercises/ae82edb6

def ascii_value(str_in)
  str_in.chars.map(&:ord).sum
end

# P:
#   Question:
#     Write a method that determines and returns the ASCII string value of a
#     string that is passed in as an argument.
#   Rules/Reqs:
#     ASCII value of a string is the sum of ASCII values of all characters.
#     ASCII string value can be found with String#ord
#   IO:
#     In: String
#     Out: Integer
#   Mental Model:
#     Given an input string, compute the total ASCII value of all characters.

# E:
#   Test Cases:
puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# D:
#   Structure: An array so we can map to ASCII val and reduce by sum

# A (Pseudocode):
#   Given an input string:
#     Split the string into an array of characters.
#     For each character in the array:
#       Map the string character to its ASCII value (using String#ord)
#     Return the sum of the array
