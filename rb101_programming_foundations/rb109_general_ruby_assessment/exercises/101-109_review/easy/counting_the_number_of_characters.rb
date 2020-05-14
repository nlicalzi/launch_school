# Source: https://launchschool.com/exercises/f85563ae

# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a
# character.

print 'Please write word or multiple words: '
str = gets.chomp

puts "There are #{str.delete(' ').size} characters in '#{str}'."
