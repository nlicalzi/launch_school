# Source: https://launchschool.com/exercises/a1afc619

def featured(n)
  return "There is no possible number that fulfills those requirements" if n >= 9_876_543_210

  loop do
    n += 1
    break if (n % 7).zero? && n.odd? && n.digits.size == n.digits.uniq.size
  end

  n
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999)
