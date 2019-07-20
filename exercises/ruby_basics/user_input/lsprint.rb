# Launch School Printer (Part 1), User Input, Ruby Basics, Exercises

def printer
  puts ">> How many output lines do you want? Enter a number >= 3: "
  lines = nil

  loop do
    lines = gets.chomp.to_i
    break if lines >= 3
    puts ">> That's not enough lines."
  end

  lines.times {puts "Launch School is the best!"}
end

printer
