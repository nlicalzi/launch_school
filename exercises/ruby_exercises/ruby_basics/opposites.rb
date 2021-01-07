# Opposites Attract, User Input, Ruby Basics, Exercises

# Request two integers from the user
# Check to make sure that one of the two is negative, if not-- restart the loop
# Add the integers
# Display the result

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_integer
  loop do
    puts ">> Please enter a positive or negative integer:"
    input_int = gets.chomp
    return input_int.to_i if valid_number?(input_int)
    puts ">> Invalid input, only non-zero integers are allowed."
  end
end

int_a = nil
int_b = nil

loop do
  int_a = get_integer
  int_b = get_integer
  break if int_a * int_b < 0 # this ensures one is negative, and breaks the loop
  puts ">> Sorry, one integer must be positive and one must be negative."
  puts ">> Please start over."
end

puts "#{int_a} + #{int_b} = #{int_a + int_b}"
