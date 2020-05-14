# Source: https://launchschool.com/exercises/192719a5

# -Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.
# -For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.
# -You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc.

def string_to_integer(str)
  str.chars.map { |char| char.ord - 48 }
end

puts string_to_integer('4321') #== 4321
puts string_to_integer('570') #== 570
