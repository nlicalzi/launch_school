# Source: https://launchschool.com/exercises/8bbbc072

def substrings_at_start(str)
  out = []
  str.size.times do |idx|
    out << str[(0..idx)]
  end
  out
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
