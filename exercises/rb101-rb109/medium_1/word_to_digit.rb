# Source: https://launchschool.com/exercises/753d4461

# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

NUMS = (0..9).to_a.freeze
WORDS = %w(zero one two three four five six seven eight nine).freeze
WORD_HSH = [WORDS, NUMS].transpose.to_h.freeze

def word_to_digit(str)
  WORDS.each do |wrd|
    str.gsub!(wrd, WORD_HSH[wrd].to_s) # replace wrd in place w/ hsh val of wrd
  end
  str # return our modified str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
