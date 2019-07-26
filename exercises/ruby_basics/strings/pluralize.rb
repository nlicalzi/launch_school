# Pluralize, Strings, Ruby Basics, Exercises

words = 'car human elephant airplane'

words.split(' ').each {|word| puts word + 's ' } # own solution

words.split(' ').each do |word|
  puts word + 's'
end                                              # LS solution
