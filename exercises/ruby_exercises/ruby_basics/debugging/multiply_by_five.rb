# Multiply by Five, Debugging, Ruby Basics, Exercises

def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp # This sets number to a string, not an integer

puts "The result is #{multiply_by_five(number)}!"

# The above code returns, upon inputting 10, "The result is 1010101010"
# The issue is that number = gets.chomp needs a .to_i at the end!
