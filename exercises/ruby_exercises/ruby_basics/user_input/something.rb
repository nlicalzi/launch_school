# Print Something (Part 1), User Input, Ruby Basics, Exercises

def something
  puts ">> Do you want me to print something? (y/n)"
  answer = gets.chomp.to_s.downcase # Further Exploration: added .downcase to accept "Y" or "y" equally
  puts "something" if answer == "y"
end

something
