# https://launchschool.com/exercises/dfa7db2c

# Write a method to determine return a boolean value based on whether a given
# integer is odd, without using .odd? or .even?

def is_odd?(int)
  int % 2 == 1
end

puts is_odd?(2) == false
puts is_odd?(5) == true
puts is_odd?(-17) == true
puts is_odd?(-8) == false
puts is_odd?(0) == false
puts is_odd?(7) == true
