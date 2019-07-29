# Even Numbers, Debugging, Ruby Basics, Exercises

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n| # We replace .map with .select to filter the array
  n if n.even?
end

p even_numbers
