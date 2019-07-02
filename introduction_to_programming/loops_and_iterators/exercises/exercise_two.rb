# Exercise 2, Loops and Iterators, Intro to Programming, Launch School

def input_check()
  ask = "Would you like me to continue asking you this question? Type STOP to exit loop."
  response = ""
  while response != "STOP"
    p "#{ask}"
    response = gets.chomp.to_s
  end
  p "Okay! Exiting now..."
end

input_check
