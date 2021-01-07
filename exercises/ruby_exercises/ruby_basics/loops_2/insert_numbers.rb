numbers = []

loop do
  puts 'Enter any number: '
  input = gets.chomp.to_i
  numbers << input

  if numbers.size != 5
    puts "We have #{numbers.size} numbers in our list: #{numbers}."
  else
    puts "Nice! We reached 5 numbers! Check 'em out: #{numbers}."
    break
  end

end
puts numbers
