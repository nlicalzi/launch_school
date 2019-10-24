# Source: https://launchschool.com/exercises/b5c55bc6

def twice(num)
  return num * 2 unless num.to_s.size.even? # odd
  len = num.to_s.size
  first_half = num.to_s[0..(len/2) - 1]
  return num * 2 unless num == (first_half * 2).to_i
  num
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
