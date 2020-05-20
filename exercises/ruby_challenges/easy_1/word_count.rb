# source: https://launchschool.com/exercises/e060c934

# Q: Write a program that given a phrase can count the occurrences of each
# word in that phrase.

class Phrase
  def initialize(phrase)
    @words = phrase.downcase\
                   .gsub(/[^a-zA-Z0-9' ]/, ' ')\
                   .split\
                   .join(' ')\
                   .split
  end

  def word_count
    out = {}
    words.uniq.each { |word| out[word] = words.count(word) }
    out
  end

  private
  attr_accessor :phrase, :words
end