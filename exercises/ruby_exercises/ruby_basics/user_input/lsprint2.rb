# Launch School Printer (Pt. 2), User Input, Ruby Basics, Exercises


def lsprinter
  loop do
    lines_input = nil
    number_of_lines = nil  

    loop do
      puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit):"
      lines_input = gets.chomp.to_s
    
      break if lines_input.downcase == "q" 
    
      number_of_lines = lines_input.to_i
      break if number_of_lines >= 3
      puts ">> That's not enough lines"    
    end

    break if lines_input.downcase == "q"

    while number_of_lines > 0
      puts "Launch School is the best!"
      number_of_lines  -= 1
    end
  end
end

lsprinter
