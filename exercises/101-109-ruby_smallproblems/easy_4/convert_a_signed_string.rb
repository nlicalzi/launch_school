# Source: https://launchschool.com/exercises/52e5f20f

STR_CONVERT = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}.freeze # We freeze this because it's a mutable object assigned to a constant

def string_to_signed_integer(input)
  out = 0
  input_digits = input.tr('^0-9', '')
  input_digits.chars.each { |x| out = (out * 10) + STR_CONVERT[x] }
  return -out if input.include? '-'
  out
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
