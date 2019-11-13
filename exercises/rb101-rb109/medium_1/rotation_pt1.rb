# Source: https://launchschool.com/exercises/4b2a26d5

# Q: Write a method that rotates an array by moving the first element to the end
#    of the array. The original array should not be modified.

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  arr = str.chars
  arr_out = arr[1..-1] + [arr[0]]
  arr_out.join
end

def rotate_integer(int)
  arr = int.to_s.chars
  arr_out = arr[1..-1] + [arr[0]]
  arr_out.join.to_i
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
#
# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

p "Array method works? : #{rotate_array(%w(a b c)) == %w(b c a)}"
p "String method works? : #{rotate_string('dachshund') == 'achshundd'}"
p "Integer method works? : #{rotate_integer(123_456) == 234_561}"
