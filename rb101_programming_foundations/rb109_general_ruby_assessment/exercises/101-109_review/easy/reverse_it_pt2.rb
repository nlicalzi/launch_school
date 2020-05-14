# Source: https://launchschool.com/exercises/b415a65e

def reverse_words(str)
  str.split.map { |x| x.size < 5 ? x : x.reverse }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
