# Exercise 5, Flow Control, Intro to Programming, Launch School

def number_binner
  p "Please insert a number for binning below:"
  num_in = gets.chomp.to_i
  answer = case
  when (num_in >= 0) && (num_in <= 50)
    p "#{num_in} is between 0 and 50"
  when (num_in >= 51) && (num_in <= 100) 
    p "#{num_in} is between 51 and 100"
  when (num_in >= 100)
    p "#{num_in} is greater than 100"
  else
    p "Sorry, #{num_in} doesn't fall into any of our bins"
  end
end

number_binner
