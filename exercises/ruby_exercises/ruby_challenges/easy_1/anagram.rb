# source: https://launchschool.com/exercises/2fc03016

# Q: Write a program that, given a word and a list of possible anagrams,
# selects the correct sublist that contains the anagrams of the word.

class Anagram
  def initialize(str)
    @original = str
  end

  def match(arr)
    arr.select do |word|
      next if word.downcase == @original.downcase
      word.downcase.chars.sort == @original.downcase.chars.sort
    end
  end
end