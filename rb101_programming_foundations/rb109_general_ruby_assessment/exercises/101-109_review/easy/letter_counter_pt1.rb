# Source: https://launchschool.com/exercises/e66bd409

# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.

def word_sizes(str)
  return_hsh = {}
  word_size_arr = str.split.map(&:size)
  word_size_arr.uniq.each do |len|
    return_hsh[len] = word_size_arr.count(len)
  end
  return_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
