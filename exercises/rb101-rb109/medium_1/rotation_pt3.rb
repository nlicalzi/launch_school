# Source: https://launchschool.com/exercises/db673773

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(int, place)
  arr = int.to_s.chars
  arr[-place..-1] = rotate_array(arr[-place..-1])
  arr.join.to_i
end

def max_rotation(int)
  rotation_digits = int.to_s.size
  rotation_digits.downto(2) do |place|
    int = rotate_rightmost_digits(int, place)
  end
  int
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
