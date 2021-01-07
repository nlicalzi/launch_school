# Source: https://launchschool.com/exercises/e66bd409

def word_sizes(str)
  return {} if str.size.zero?

  lens = str.split(' ').map(&:size)
  len_set = lens.uniq

  counts = {}
  len_set.each { |x| counts[x] = lens.count(x) }
  counts
end

# P:
#   Question:
#   Write a method that takes a string with one or more space separated words
#   and returns a hash that shows the number of words of different sizes.
#   Rules/Reqs:
#   Words consist of any string of characters that do not include a space.
#   If string is empty, return an empty hash.
#   IO:
#     In: String
#     Out: Hash
#   Mental Model:
#   Write a method that, for an input string, splits the string by space and
#   returns a hash representing the set of word lengths, and the count for each.

# E:
#   Test Cases:
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# D:
#   Structure: We should use an array, so we can iterate over each item.

# A (Pseudocode):
#   Read in an input string
#     If input string length is zero, return an empty hash
#   Split the string by space
#   Map the resulting split array of words to each word's length
#   Create a array of unique word lengths
#   Create hash "counts"
#   For each item in the unique array
#     Append item and item count from mapped array as key/value
#   Return hash
