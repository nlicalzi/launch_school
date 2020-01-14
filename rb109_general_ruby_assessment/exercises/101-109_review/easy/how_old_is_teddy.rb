# Source: https://launchschool.com/exercises/84376930

# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.

def print_persons_age(name = 'Teddy')
  puts "#{name} is #{rand(20..200)} years old!"
end

print_persons_age
