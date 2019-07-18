# Loop on Command, Loops 1, Ruby Basics, Exercises

loop do
  puts 'Should I stop looping? (input: `yes`)'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Does not compute. Please answer `yes`.'
end

puts 'Ok, exiting loop!'
