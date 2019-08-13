# Source: https://launchschool.com/exercises/b720efd9

# Q: Write a program that asks the user to enter an integer greater than 0, then
#   asks if the user wants to determine the sum or product of all numbers
#   between 1 and the entered integer.

# P:
#   Given an input of an integer greater than 0, either return the sum or the
#   product of all numbers between 1 and the input.
#   Questions:
#     Are we considering sum/product inclusive of 1 and input?
#     Can we assume input is an integer? Can we cast floats to nearest ints?

# E:

# D:
#   in: integer & string
#   out: integer

# A:
#   Request input of an integer > 0 (loop)
#     Reject as invalid if non-integer input, re-loop
#     If valid input, break loop
#   Request [s]um or [p]roduct as operation
#   Set output to perform operation(range(0, input))
#   Return output
#   Offer another calculation loop
#     If 'no', break
#   Say goodbye!

VALID_OPERATION = %w(s p)

def prompt(message)
  puts "=> #{message}"
end

def valid_measurement?(input)
  (input.to_i.to_s == input) && input.to_i.positive?
end

loop do
  input = ''
  operation = ''

  prompt('Welcome to the sum/product range calculator!')

  loop do
    prompt('Please enter a positive integer below:')
    input = gets.chomp
    break if valid_measurement?(input)
    prompt('Sorry, that input is invalid...')
  end

  loop do
    prompt("Should I return [s]um or [p]roduct of the range btw. 0 & #{input}?")
    operation = gets.chomp.downcase
    break if VALID_OPERATION.any? { |x| operation.start_with?(x) }
    prompt('Sorry, that input is invalid...')
  end

  if operation == 's'
    output = 0
    (1..input.to_i).each { |x| output += x }
    puts output
  elsif operation == 'p'
    output = 1
    (1..input.to_i).each { |x| output *= x }
    puts output
  end

  prompt("Your return value is #{output}!")
  prompt('Would you like to perform another calculation? Enter [n]o to exit.')
  calculate_again = gets.downcase
  break if calculate_again.start_with?('n')
end

prompt('Thanks for using the sum/product range calculator!')
