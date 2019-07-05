# Exercise 15, Intro to Programming, Launch School

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

p "Our array is: #{arr}"

arr.delete_if { |word| word.downcase.start_with?("s") }

p "Array with words starting with 's' deleted: #{arr}"

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |word| word.downcase.start_with?("s") || 
                       word.downcase.start_with?("w")
              } # could also be done in one-line with .start_with?('s', 'w')

p "Array with words starting with 's' or 'w' deleted: #{arr}"
