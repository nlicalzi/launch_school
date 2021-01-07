# Source: https://launchschool.com/exercises/29ffd590

def print_boundary(len)
  p "+#{'-' * (len + 2)}+"
end

def print_middle(len)
  p "|#{' ' * (len + 2)}|"
end

def print_in_box(str)
  len = str.size

  if len > 78
    print_boundary(76)
    print_middle(76)
    str.scan(/.{1,76}/).each do |chunk|
      buffer = (78 - chunk.size) / 2
      p "|#{' ' * buffer}#{chunk}#{' ' * buffer}|"
    end
    print_middle(76)
    print_boundary(76)
  else
    print_boundary(len)
    print_middle(len)
    p "| #{str} |"
    print_middle(len)
    print_boundary(len)
  end


end

print_in_box('hello')

print_in_box("i'm in a box!")
print_in_box("Both forms iterate through str, matching the pattern (which may be a Regexp or a String). For each match, a result is generated and either added to the result array or passed to the block. If the pattern contains no groups, each individual result consists of the matched string, $&. If the pattern contains groups, each individual result is itself an array containing one entry per group.")

# P:
#   Question:
#     Write a method that will take a short line of text, and print it within a
#     box.
#   Rules/Reqs:
#     An empty string input will return a box of size 4 x 5
#     You may assume that the input will always fit in your terminal window.
#       Line of text will always be less than 80 chars
#   IO:
#     In: String
#     Out: Multiple strings
#   Mental Model:
# E:
#   Test Cases:
# D:
#   Structure:
# A (Pseudocode):
#   Accept input str
#   Instantiate str_size as str.size
#   Print +, (- * str_size) + 2, +
#   Print |, (- * str_size) + 2, +
#   Print |, space, str, space, |
#   Print |, (- * str_size) + 2, +
#   Print +, (- * str_size) + 2, +
