# Source: https://launchschool.com/exercises/ce453287

# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.

def sum_square_difference(n)
  arr = 1.upto(n).to_a
  square_sum = arr.sum**2
  sum_squares = arr.map { |x| x**2 }.sum

  square_sum - sum_squares
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1).zero?
puts sum_square_difference(100) == 25_164_150
