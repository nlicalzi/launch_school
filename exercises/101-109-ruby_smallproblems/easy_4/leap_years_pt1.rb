# Source: https://launchschool.com/exercises/f44b8f8b

# P:
#   Question:
#     Write a method that takes any year greater than 0 as input, and returns true
#     if the year is a leap year, or false if it is not a leap year.
#   Rules and Reqs:
#     Leap years occur in years divisible by 4 but not by 100 unless also by 400.
#     Assume a year greater than year 0.
#   Mental Model:
#     Accept a 'year' input of a positive integer. If 400 is a factor of 'year',
#     return true, if 400 is not a factor of 'year', but 100 is a factor of year,
#     return false, else if 4 is a factor of 'year', return true.

def leap_year?(year)
  return true if (year % 400).zero?
  return false if (year % 100).zero?
  return true if (year % 4).zero?
  false
end

# E:
puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240_000) == true
puts leap_year?(240_001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# D:
#   In: Positive Integer 'year'
#   Out: Boolean value 'is_leap_year'

# A:
#   Accept a 'year' input of a positive integer.
#   If 400 is a factor of 'year':
#     return true
#   Elsif 400 is not a factor of 'year', but 100 is a factor of year:
#     return false
#   Elsif 4 is a factor of 'year':
#     return true,
#   Else:
#     return false
