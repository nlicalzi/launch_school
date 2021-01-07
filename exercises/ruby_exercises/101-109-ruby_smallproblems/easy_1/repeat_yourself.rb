# Source: https://launchschool.com/exercises/a018e581
# Question: Write a method that takes two arguments, a string and a positive
#           integer, and prints the string as many times as integer indicates.

def repeat(str_in, times)
  print check_string(str_in) * check_int(times)
end

def check_string(str_in)
  raise TypeError, 'Input is not a string' unless str_in.is_a? String

  str_in
end

def check_int(times)
  raise TypeError, 'Input is not an integer' unless times.is_a? Integer
  raise ArgumentError, 'Input is not greater than zero' unless times.positive?

  times
end

repeat('Hello', 4)

# P:
#   Method accepts two arguments
#     One argument is a string
#     One argument is a positive integer
#   Print `string` `integer` times
#
# Should we assume that integers are clean? Always string first and then
# positive int?

# E:
#   repeat('Hello', 3) # expected result: 'HelloHelloHello'
#   repeat('Hello', 0) # expected result: ''
#   repeat('', 3) # expected result: ''
#   repeat('Hello') # expected result: ArgumentError,wrong number of arguments
#   repeat(3) # expected result: ArgumentError, wrong number of arguments
#   repeat(0, 'Hello')
#   repeat(2, 3, 'Hello')
#   repeat('Hello', -3)

# D:
#   We will ingest one string and one integer
#   We will print a string, x times

# A:
#  Take input of a string and an integer
#  Return type error unless types are string and integer
#  Print string * integer
