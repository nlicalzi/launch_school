# Source: https://launchschool.com/exercises/8a66610c

def sum_of_sums(arr)
  reducer = 0
  arr.size.times do |idx|
    reducer += arr[(0..idx)].sum
  end
  reducer
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
