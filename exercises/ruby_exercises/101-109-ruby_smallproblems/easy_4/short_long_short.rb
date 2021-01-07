# Source: https://launchschool.com/exercises/f175ddac

def short_long_short(str1, str2)
  return str1 + str2 + str1 unless str1.length > str2.length
  str2 + str1 + str2
end

# P:
#   Question:
#     Write a method that takes two strings as arguments, determines the longest of the two strings,
#     and then returns the result of concatenating the shorter string, the longer string, and the
#     shorter string once again. You may assume that the strings are of different lengths.
#   Requirements:
#     .
#   Rules:
#     The input will be two strings of different lengths.
#   Mental Model:
#     Write a method that accepts two strings of different lengths. Determine which string is longer and which is shorter,
#     then concatenate the shorter string (x) with the longer string (y) in this pattern: xyx, and return it.

# E:
#   Test Cases:
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

# D:
#   In:
#     Method that takes two string arguments: x and y
#   Out:
#     Concatenated string shorter+longer+shorter

# A:
#   Accept two strings: x and y
#   Compare string length
#     If x is longer than y:
#       return yxy
#     Else return xyx
