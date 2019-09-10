# Source: https://launchschool.com/exercises/c688f4e5

NUMS =  %w(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19).map(&:to_i)
WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve
           thirteen fourteen fifteen sixteen seventeen eighteen nineteen).freeze
NUMS_TO_WORDS = Hash[NUMS.zip(WORDS)]
WORDS_TO_NUMS = Hash[WORDS.zip(NUMS)]

 def alphabetic_number_sort(arr)
   words = arr.map { |num| NUMS_TO_WORDS[num]}
   words.sort!
   words.map { |word| WORDS_TO_NUMS[word]}
 end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
