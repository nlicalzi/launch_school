# Source: https://launchschool.com/exercises/70718e76

def substrings_at_start(str)
  out = []
  str.size.times do |idx|
    out << str[(0..idx)]
  end
  out
end

def substrings(str)
  out = []
  idx = 0
  len = str.size
  while idx < len
    out << substrings_at_start(str[idx..len])
    idx += 1
  end
  out.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
