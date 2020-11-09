# Source: https://launchschool.com/exercises/93efd352

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

def palindromes(str)
  substrings(str).select do |str|
    str.size > 1 && str == str.reverse
  end
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
