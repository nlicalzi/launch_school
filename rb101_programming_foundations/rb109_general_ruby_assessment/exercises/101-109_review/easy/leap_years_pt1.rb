# Source: https://launchschool.com/exercises/f44b8f8b

# Write a method that takes any year greater than 0 as input, and returns true
# if the year is a leap year, or false if it is not a leap year.

# leap years are divisible by 4, but if they're divisible by 100, also by 400

def leap_year?(year)
  return false unless (year % 4).zero?
  return false if (year % 100).zero? && !(year % 400).zero?
  true
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
