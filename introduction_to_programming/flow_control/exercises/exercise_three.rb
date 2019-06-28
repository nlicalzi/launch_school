# Exercise 3, Flow Control, Intro to Programming, Launch School
# Could modify by excepting strings/changing error handling

def number_binner
  p "Please insert a number for binning below:"
  num_in = gets.chomp.to_i
  if (num_in >= 0) && (num_in <= 50)
    p "#{num_in} is between 0 and 50"
  elsif (num_in >= 51) && (num_in <= 100) 
    p "#{num_in} is between 51 and 100"
  elsif (num_in >= 100)
    p "#{num_in} is greater than 100"
  else
    p "Sorry, #{num_in} doesn't fall into any of our bins"
  end
end

number_binner
