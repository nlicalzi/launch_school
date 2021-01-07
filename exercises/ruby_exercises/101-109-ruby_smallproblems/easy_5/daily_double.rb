# Source: https://launchschool.com/exercises/690b2900

def crunch(str)
  out_str = ''
  str = str.chars

  until str.empty?
    if out_str[-1] != str[0]
      out_str << str.shift
    else
      str.shift
    end
  end
  out_str
end

# P:
#   Question:
#   Write a method that takes a string argument and returns a new string that
#   contains the value of the original string with all consecutive duplicate
#   characters collapsed into a single character.
#   Rules/Reqs:
#   You may not use String#squeeze or String#squeeze!
#   An input string of len 0 should return a str of len 0
#   IO:
#     In: String
#     Out: String
#   Mental Model:
#   Given an input string, collapse any sequences of duplicate characters into a
#   single character, and return the modified string.

# E:
#   Test Cases:
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# D:
#   Structure: Array

# A (Pseudocode):
#   Accept an input_string
#   Create an output_string
#   initialize var counter and set to 0
#   while counter < input_string.size
#     if output_string[-1] != input_string[0]
#       output_string << input_string.shift
#     else input_string.shift
#     counter ++
#   return output_string
