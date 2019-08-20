# Source: https://launchschool.com/exercises/8fca300b

def real_palindrome?(input) # all of these work for either inputs or arrays!
  input = input.downcase.gsub(/[^0-9a-z]/i, '')
  input == input.reverse
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
