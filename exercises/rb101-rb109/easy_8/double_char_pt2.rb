# Source: https://launchschool.com/exercises/86fbfc4c

ALPHABET = ('a'..'z').to_a
VOWELS = %w(a e i o u)
CONSONANTS = ALPHABET - VOWELS

def double_consonants(str)
  str.chars.map do |char|
    if CONSONANTS.include?(char.downcase)
      char * 2
    else
      char
    end
  end.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
