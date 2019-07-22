# Dividing Numbers, User Input, Ruby Basics, Exercises

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def get_numerator
  numerator = nil
  loop do
    puts ">> Please enter the numerator:"
    numerator = gets.chomp
    break if valid_number?(numerator)
    puts ">> Invalid input. Only integers are allowed"
  end

  numerator
end

def get_denom
  denom = nil
  loop do
    puts ">> Please enter the denominator:"
    denom = gets.chomp
    if denom == "0"
      puts ">> Invalid input. Don't divide by 0!"
    else 
      break if valid_number?(denom)
      puts ">> Invalid input. Only integers are allowed"
    end
  end

  denom
end

def division
  numerator = get_numerator
  denom = get_denom
  puts "#{numerator} / #{denom} is #{numerator.to_i / denom.to_i}"
end

division
