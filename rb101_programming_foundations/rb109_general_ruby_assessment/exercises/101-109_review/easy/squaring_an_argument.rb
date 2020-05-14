# Source: https://launchschool.com/exercises/d24fe972

# Using the multiply method from the "Multiplying Two Numbers" problem, write a
# method that computes the square of its argument (the square is the result of
# multiplying a number by itself).

def multiply(x, y)
  x * y
end

def square(x)
  multiply(x, x)
end

puts square(5) == 25
puts square(-8) == 64
