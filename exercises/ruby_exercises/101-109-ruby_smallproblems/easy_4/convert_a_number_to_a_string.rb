# Source: https://launchschool.com/exercises/cdc65476

INT_CONVERT = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'
}.freeze # We freeze this because it's a mutable object assigned to a constant

def integer_to_string(num)
  num.digits.map { |x| INT_CONVERT[x] }.reverse.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
