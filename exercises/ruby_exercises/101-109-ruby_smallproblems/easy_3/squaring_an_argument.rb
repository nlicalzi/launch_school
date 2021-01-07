# Source: https://launchschool.com/exercises/d24fe972

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power_to_the_n(num, power)
  orig_num = num
  power -= 1 # Need this to 'index' our powers appropriately

  power.times do
    num = multiply(orig_num, num)
  end

  num
end

puts square(5) == 25
puts square(-8) == 64
puts power_to_the_n(2, 3) == 8
puts power_to_the_n(3, 3) == 27
puts power_to_the_n(1, 6) == 1
puts power_to_the_n(5, 3) == 125
