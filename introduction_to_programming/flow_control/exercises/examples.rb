# Example 1
if x == 3
  puts "x is 3"
end

# Example 2
if x == 3
  puts "x is 3"
elsif x == 4
  puts "x is 4"
end

# Example 3
if x == 3
  puts "x is 3"
else
  puts "x is NOT 3"
end

# Example 4: must us "then" keyword when using 1-line syntax
if x == 3 then puts "x is 3" end

# Example 5: Ruby is expressive! Re-writing example 1 in one line
puts "x is 3" if x == 3

# Example 6: There is also a reserved word, "unless"! It's the opposite of if
puts "x is not 3" unless x == 3
