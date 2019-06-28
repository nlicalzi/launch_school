# Exercise 2, Flow Control, Intro to Programming, Launch School

def make_upper
  p "Enter the string you'd like to make uppercase below:"
  user_input = gets.chomp.to_s  
  if user_input.length > 10
    string_out = user_input.upcase
  else
    string_out = user_input
  end
  puts string_out # print the string
  string_out  # return the string 
end

make_upper
