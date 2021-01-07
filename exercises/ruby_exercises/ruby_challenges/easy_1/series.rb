# source: https://launchschool.com/exercises/3db163fb

# Q: Write a program that will take a string of digits and give you all the
# possible consecutive number series of length n in that string.

# Problem
# Given an input string, we are to return all possible "slices" of length n

# Examples
test_1 = "01234"

# Data structure
# We're appending results from each iteration to an array

# Algo (pseudo code)
# for a given string `str` and slice size `n`
#   initialize an empty Array `result`
#   initialize a counter `idx` to 0
#   while idx < (str.size - n)
#     result << str[idx..idx+n-1]
#     idx += 1
#   end
#   return result

# Code
class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(n)
    raise ArgumentError.new("Slice size is too large.") unless n <= str.size

    result = []
    idx = 0

    while idx < (str.size - n + 1)
      result << str[idx..(idx+n-1)].chars.map(&:to_i)
      idx += 1
    end
    result
  end
end


# LS Implementation

# class Series
#   attr_reader :numbers

#   def initialize(str)
#     @numbers = str.chars.map(&:to_i)
#   end

#   def slices(len)
#     raise ArgumentError('Slice size is too large.') if len > numbers.size
#     numbers.each_cons(len).to_a
#   end
# end