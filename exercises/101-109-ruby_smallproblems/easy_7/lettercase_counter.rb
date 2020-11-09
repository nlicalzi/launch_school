# Source: https://launchschool.com/exercises/96e0267a

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_case_count(str)
  out = {}
  out[:lowercase] = str.chars.map { |x| LOWERCASE.include?(x) ? 1 : 0 }.sum
  out[:uppercase] = str.chars.map { |x| UPPERCASE.include?(x) ? 1 : 0 }.sum
  out[:neither] = str.chars.map { |x| (UPPERCASE + LOWERCASE).include?(x) ? 0 : 1 }.sum
  out
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
