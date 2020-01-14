# Source: https://launchschool.com/exercises/71ca3279
# Source: https://launchschool.com/exercises/8fca300b

ALPHA = ('a'..'z').to_a
INTS = (0..9).to_a

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  out = str.downcase.chars.select { |x| ALPHA.include?(x) || INTS.include?(x) }
  palindrome?(out)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
