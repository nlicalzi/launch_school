# Source: https://launchschool.com/exercises/1af9d2f7

# Q: Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the user.

def prompt(message)
  puts "=> #{message}"
end

def yell(message)
  puts message.upcase
end

prompt('Please enter your name below:')
name = gets.chomp.capitalize

if name[-1] == '!'
  yell("Hello #{name.chop}, why are we yelling?")
else
  prompt("Hello #{name}.")
end

# P: Prompt a user for their name and greet them. If their name ends with a `!`,
# greet them in all-caps and ask why we are screaming
  # Can we assume...
  #   The input is a string of non-zero length?
  #   Any exclamation mark will be preceded by a string of non-zero length?

# E:
#   What is your name? Bob
#   => Hello Bob.

#   What is your name? Bob!
#   => HELLO BOB. WHY ARE WE SCREAMING?

# D:
#   in: string
#   out: string

# A:
#   Prompt user to input `name`
#   If the last character in name == `!`
#     Print an upcase-d, interpolated string yelling a greeting at `name`
#   Else print interpolated string greeting `name`
