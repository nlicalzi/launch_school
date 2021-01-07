# Source: https://launchschool.com/exercises/51e98567

# Q: Write a method that takes one argument, a string, and returns a new string
#    with the words in reverse order.

sentence = 'We reversed this sentence successfully'

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence(sentence)

# P: Ingest a string, reverse the order of words in it, and return a new string.

# E:
#    puts reverse_sentence('') == '' => true
#    puts reverse_sentence('Hello World') == 'World Hello' => true
#    puts reverse_sentence('Reverse these words') == 'words these Reverse' => true

# D: in: String
#    out: String

# A: Read in a string
#    Split string into an array of individual elements
#    Reverse the elements in said array
#    Join elements in reversed array with ' ' separation
