# Source: https://launchschool.com/exercises/3c1388d3

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

def signed_integer_to_string(num)
  out = num.digits.map { |x| INT_CONVERT[x] }.reverse.join
  return out if num > -1
  -out
end

puts signed_integer_to_string(4321) == '4321'
puts signed_integer_to_string(0) == '0'
puts signed_integer_to_string(5000) == '5000'
