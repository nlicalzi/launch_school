# Source: https://launchschool.com/exercises/11e2bbdc

# Q: Write a method that can rotate the last n digits of a number.
# Assume n is always a positive integer

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, place)
  arr = num.to_s.chars
  arr[-place..-1] = rotate_array(arr[-place..-1])
  arr.join.to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
