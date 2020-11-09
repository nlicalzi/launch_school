# Source: https://launchschool.com/exercises/5c3e3cf3

# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
# characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence.

def get_longest_sentence(file)
  open(file) do |f|
    data = f.read.chomp
    sentences = data.split(/[.?!]/)
    sentence_lengths = sentences.map { |x| x.split(' ').size }
    puts sentences[sentence_lengths.find_index(sentence_lengths.max)]
    puts "File: #{file}."
    puts "Sentence length: #{sentence_lengths.max} words long"
  end
end

get_longest_sentence('resources/longest_sentence.txt')
puts
get_longest_sentence('resources/frankenstein.txt')
