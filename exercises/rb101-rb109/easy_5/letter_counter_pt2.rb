# Source: https://launchschool.com/exercises/16124e4d

def word_sizes(str)
  return {} if str.size.zero?

  str = str.downcase.gsub(/[^a-z\s]/i, '')

  lens = str.split(' ').map(&:size)
  len_set = lens.uniq

  counts = {}
  len_set.each { |x| counts[x] = lens.count(x) }
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
