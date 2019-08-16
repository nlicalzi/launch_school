# Source: https://launchschool.com/exercises/f85563ae

def prompt(msg)
  puts "==> #{msg}"
end

prompt('Please input a word or multiple words below: ')

input = gets.chomp

puts "There are #{input.split.join.size} characters in #{input}!"
