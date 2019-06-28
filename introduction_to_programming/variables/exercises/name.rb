puts "Hey there; please enter your first name below."

first = gets.chomp

puts "Great! And now the same for your last name, please."

second = gets.chomp

puts "Perfect, thank you and welcome, #{first} #{second}"

10.times do |n|
  puts first + " " + second
end

