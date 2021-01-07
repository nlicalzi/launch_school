number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  puts "Number A: #{number_a}, Number B: #{number_b}."
  next unless number_a == 5 || number_b == 5  

  puts "5 was reached!"
  break
end

# Further Exploration
# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   puts "Number A: #{number_a}, Number B: #{number_b}."
#   
#   if number_a == 5 || number_b == 5
#     puts "5 was reached!"
#     break
#   end
# end

# Answer: Next isn't the best option, since loops continue by themselves by default...
