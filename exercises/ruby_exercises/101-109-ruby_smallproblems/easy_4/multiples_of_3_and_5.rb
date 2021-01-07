# Source: https://launchschool.com/exercises/675bc8c9

def multisum(max_val)
  valid_factor = []

  (1..max_val).each do |x|
    valid_factor << x if (x % 3).zero? || (x % 5).zero?
  end

  valid_factor.sum
end

# P:
  # Question:
  #   Write a method that searches for all multiples of 3 or 5 that lie between
  #   1 and some other number, and then computes the sum of those multiples.
#   In/Out:
#     In: One number
#     Out: An integer sum
#   Rules/Reqs:
#     - You may assume that the number passed in is an integer greater than 1.
#   Mental Model:
#     Given a positive input integer greater than 1, create an array containing all
#     multiples of 3 and 5 that exist in the range of 1..integer, then return the
#     sum of the array.

# E:
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1_000) == 234_168

# D:
#   We should use an array that we can add to then reduce or sum at the end.

# A:
#   Accept an input 'end_num' parameter in our method
#   Create array 'valid'
#   Create a range from 1 to end_num
#     For each element in range, append to valid if 3 or 5 is a valid factor
#   Return the sum of the array
