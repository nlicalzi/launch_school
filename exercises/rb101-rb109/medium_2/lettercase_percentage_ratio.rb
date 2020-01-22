# Source: https://launchschool.com/exercises/e0500589

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(str)
  char_arr = str.chars
  total_len = char_arr.size

  lower_pct = char_arr.select { |char| ('a'..'z').to_a.include?(char) }.size / total_len.to_f * 100
  upper_pct = char_arr.select { |char| ('A'..'Z').to_a.include?(char) }.size / total_len.to_f * 100
  neither_pct = (100 - lower_pct - upper_pct)

  { lowercase: lower_pct, uppercase: upper_pct, neither: neither_pct }
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
