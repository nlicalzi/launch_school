# Source: https://launchschool.com/exercises/41d59cf3

def leap_year?(year)
  if year > 1752
    return true if (year % 400).zero?
    return false if (year % 100).zero?
    return true if (year % 4).zero?
    false
  else (year % 4).zero?
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240_000) == true
puts leap_year?(240_001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
