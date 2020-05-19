# source: https://launchschool.com/exercises/09b0d367

# P
# Implement a new class Octal, which takes a string argument when initialized.
# The class should return 0 unless the input is a string representation of an integer
# The class should return 0 if any of its chars isn't a valid octal # (aka > 7)
# Octal has 1 public method #to_decimal: it converts an octal number to decimal form

# E
# Provided in tests/octal_test.rb

# D
# Split the string to an array of characters and iterate

# A
# For a given Octal object with an `input_val` array instance variable of str characters
# Return 0 unless each char is a valid octal digit (included in (0..7).to_a)
# Set `char_count` to the size of the string `char_count = input.size`
# Initialize output array `result = []`
# For each digit, with its index (char, idx)
#   set `power_of_eight` to `char_count` - `idx` - 1
#   

# C

class Octal
  attr_reader :digits
  VALID_OCTAL_CHARS = %w(0 1 2 3 4 5 6 7)

  def initialize(str)
    @digits = str.chars
  end

  def to_decimal
    return 0 unless valid_octal_input?

    result = []
    decimal_places = digits.size

    digits.each_with_index do |el, idx|
      power = decimal_places - idx - 1
      result << el.to_i * (8 ** power)
    end
    result.sum
  end

  private
  def valid_octal_input?
    @digits.all? { |el| VALID_OCTAL_CHARS.include?(el) }
  end
end