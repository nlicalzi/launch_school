# Tricky Number, Return,Ruby Basics, Exercises

# The following code will return 1, because the if statement evaluates to true
# (true = true), and if statements return their evaluated value, in this case 
# the variable assignment number = 1, even though number isn't called, number = 1
# would return 1.

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number
