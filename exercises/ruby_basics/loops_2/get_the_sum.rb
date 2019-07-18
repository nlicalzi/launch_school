loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  
  if answer == 4
    puts "Yep, 4, nice!"
    break
  end
  
  puts "Wrong answer. Try again!"
end
