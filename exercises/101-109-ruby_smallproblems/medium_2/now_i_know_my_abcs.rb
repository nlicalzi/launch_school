# Source: https://launchschool.com/exercises/41e03303

# Create a hash with the letter block pairs
BLOCK_PAIRS = {
  'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A', 'G' => 'T',
  'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y',
  'Z' => 'M'
}.freeze

# Take a given word
# Unless str.chars.unique.size == str.size, return false (check for repeated chars)
# Break the word into its component characters, and for each char:
#   If the character array includes block_pairs[char], return false
#   Else, return true

def block_word?(str)
  return false unless str.chars.uniq.size == str.size
  char_arr = str.upcase.chars
  char_arr.none? { |char| char_arr.include?(BLOCK_PAIRS[char]) }
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
