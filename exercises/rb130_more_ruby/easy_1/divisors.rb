# Source: https://launchschool.com/exercises/8b99f281

def divisors(int)
  1.upto(int/2).select { |x| (int % x).zero? } << int
end

puts divisors(7) == [1, 7]
puts divisors(1) == [1]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
