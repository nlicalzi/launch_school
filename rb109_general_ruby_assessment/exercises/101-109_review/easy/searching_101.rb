# Source: https://launchschool.com/exercises/f4f25695

# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5
# numbers.

nums = %w(1st 2nd 3rd 4th 5th)
arr = []

nums.each do |num|
  puts "==> Enter the #{num} number:"
  arr << gets.chomp.to_i
end

puts '==> Enter the last number:'
last = gets.chomp.to_i

does_it_appear = arr.include?(last) ? 'appears' : 'does not appear'

puts "\nThe number #{last} #{does_it_appear} in #{arr}."
