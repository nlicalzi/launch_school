# Source: https://launchschool.com/exercises/1af9d2f7

# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the user.

print "What is your name? "
name = gets.chomp

puts name[-1] == '!' ? "HELLO #{name[0..-2].upcase}. WHY ARE WE SCREAMING?" : "Hello #{name}."
