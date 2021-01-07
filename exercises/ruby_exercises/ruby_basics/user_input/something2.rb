# Print Something (Part 2), User Input, Ruby Basics, Exercises

def loop_something
  puts ">> Do you want me to print something? (y/n)"
  answer = "" # Instantiating answer so we can modify it in the loop
  loop do
    answer = gets.chomp.to_s.downcase
    break if answer == "y" || answer == "n"
    # break if %w(y n).include?(answer)
    puts "Invalid input! Please enter y or n"
  end
  puts "something" if answer == "y"
end

loop_something
