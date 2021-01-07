# source: https://launchschool.com/exercises/997ac42a

# Q: Write a program that will take a decimal number, and convert it to the
# appropriate sequence of events for a secret handshake.

class SecretHandshake
  def initialize(val)
    @seed = valid_int?(val) && valid_binary?(val) ? val.to_i : 0
  end

  def commands
    return [] if seed.zero?
    out = []                                            # initialize output array
    binary_chars = seed.to_s(2).chars.reverse           # align binary chars to powers of 10
    
    out << 'wink' if binary_chars[0] == '1'             # ones place
    out << 'double blink' if binary_chars[1] == '1'     # tens place
    out << 'close your eyes' if binary_chars[2] == '1'  # hundreds place
    out << 'jump' if binary_chars[3] == '1'             # thousands place
    out.reverse! if binary_chars[4] == '1'              # ten thousands place

    out                                                 # return output array
  end

  private
  attr_reader :seed

  def valid_int?(val)  # check if input is a valid integer
    val.to_s == val.to_i.to_s
  end
  
  def valid_binary?(val) # check if input is a valid binary number
    binary = val.to_i.to_s(2) # Integer#to_s(base) changes the base system
    binary.chars.all? { |char| %w(0 1).include?(char) }
  end
end


# Pseudocode
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