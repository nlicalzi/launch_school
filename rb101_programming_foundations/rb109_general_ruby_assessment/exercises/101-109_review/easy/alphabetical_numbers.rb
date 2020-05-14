# Source: https://launchschool.com/exercises/c688f4e5

# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

def alphabetical_number_sort(num_strs, nums)
  hsh = [nums, num_strs].transpose.to_h
  nums.sort_by { |num| hsh[num] }
end

strs = %w(zero one two three four five six seven eight nine ten eleven
          twelve thirteen fourteen fifteen sixteen seventeen eighteen
          nineteen)
nums = (0..19).to_a

p alphabetical_number_sort(strs, nums) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
