# Source: https://launchschool.com/exercises/b415a65e

# Q: Write a method that takes one argument, a string containing one or more
#    words, and returns the given string with all five or more letter words
#    reversed. Each string will consist of only letters and spaces. Spaces
#    should be included only when more than one word is present.

def reverse_words(input)
  input.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words('Walk around the block')

# P: Reverse all words in a given string, composed only of letters and spaces
#    (e.g. don't worry about punctuation), whose length is 5 or more letters.
#    Only add a space if there is more than word in the result string.

# E:
#    puts reverse_words('Professional')          # => lanoisseforP
#    puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
#    puts reverse_words('Launch School')         # => hcnuaL loohcS

# D: in: String
#    out: String

# A: Read in a string
#    Split the string into an array
#    For any array element with length > 4, reverse the word
#    Join the array into a string with ' ' separation
#    Return the new array
