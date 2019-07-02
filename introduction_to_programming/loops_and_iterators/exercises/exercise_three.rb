# Exercise 3, Loops and Iterators, Intro to Programming, Launch School

my_array = ["January", "February", "March", "April", "May", "June", "July"]

my_array.each_with_index { |val,index| puts "index: #{index}, month: #{val}" }
