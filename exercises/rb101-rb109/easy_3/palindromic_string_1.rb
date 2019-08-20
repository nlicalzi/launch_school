# Source: https://launchschool.com/exercises/71ca3279

def str_palindrome?(str)
  str == str.reverse
end

def arr_palindrome?(arr)
  arr == arr.reverse
end

def palindrome?(input) # all of these work for either inputs or arrays!
  input == input.reverse
end

puts 'strings: '
puts str_palindrome?('madam') == true
puts str_palindrome?('Madam') == false          # (case matters)
puts str_palindrome?("madam i'm adam") == false # (all characters matter)
puts str_palindrome?('356653') == true

puts 'arrays: '
puts arr_palindrome?(%w(m a d a m)) == true
puts arr_palindrome?(%w(M a d a m)) == false          # (case matters)
puts arr_palindrome?(%w(m a d a m i ' m a d a m)) == false # (all characters matter)
puts arr_palindrome?(%w(356633)) == true

puts 'mixed: '
puts palindrome?(%w(356633)) == true
puts palindrome?('madam') == true
puts palindrome?(%w(M a d a m)) == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
