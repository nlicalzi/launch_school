# source: https://launchschool.com/exercises/997ac42a

# Q: Write a program that will take a decimal number, and convert it to the
# appropriate sequence of events for a secret handshake.

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10_000 = Reverse the order of operations in the handshake

# Integer#to_s(2) converts a number to a string representation of its binary form
# String#to_i(2) converts a binary string to an integer representation of its decimal form

# - Create a class SecretHandshake that takes one argument `seed` on initialization
#   - assign `@seed` to `seed.to_i`
# - Create an instance method SecretHandshake#commands
#   - If seed.to_i.zero? || seed.to_i.to_s != seed, return []
#   - create output array `out`
#   - split @seed into its digits and reverse their order
#     - out << 'wink' if @seed[0] == 1
#     - out << 'double blink' if @seed[1] == 1
#     - out << 'close your eyes' if @seed[2] == 1
#     - out << 'jump' if @seed[3] == 1
#     - out.reverse! if @seed[4] == 1
#   - return out
# C

class SecretHandshake
  def initialize(val)
    @seed = valid_int?(val) && valid_bool?(val) ? val.to_i : 0
  end

  def commands
    return [] if seed.zero?
    out = []
    binary_seed = seed.to_s(2) # convert to string binary form
    binary_chars = binary_seed.chars.reverse
    
    out << 'wink' if binary_chars[0] == '1'
    out << 'double blink' if binary_chars[1] == '1'
    out << 'close your eyes' if binary_chars[2] == '1'
    out << 'jump' if binary_chars[3] == '1'
    out.reverse! if binary_chars[4] == '1'

    out
  end

  private
  attr_reader :seed

  def valid_int?(val)
    val.to_s == val.to_i.to_s
  end
  
  def valid_bool?(val)
    val.to_i.to_s(2).chars.all? { |char| %w(0 1).include?(char) }
  end
end