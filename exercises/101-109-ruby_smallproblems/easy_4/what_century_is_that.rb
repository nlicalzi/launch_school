# Source: https://launchschool.com/exercises/d6a8f167

def century(year)
  tens = year.digits.shift(2).join
  centuries = year / 100

  century_num = tens.to_i > 1 ? centuries + 1 : centuries

  "#{century_num}#{suffix(century_num)}"
end

def suffix(year)
  last_two = year.digits.reverse.last(2).join

  return 'th' if %w(11 12 13).include?(last_two)

  last = last_two[-1].to_i
  case last
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

# P:
#   Question:
#     Write a method that takes a year as input and returns the century.
#   Rules/Reqs:
#     - The return value should be a string that begins with the century number,
#       and ends with st, nd, rd, or th as appropriate for that number.
#     - New centuries begin in years that end with 01. So, the years 1901-2000
#       comprise the 20th century.
#     - Can we assume the input will be a positive integer? (min century: 1st, min year: 1)
#     - Suffixes: (
#         'st': century ends in: 1 (but not 11th),
#         'nd': century ends in 2 (but not 12),
#         'rd': century ends in 3 (but not 13),
#         'th': century ends in 0, 4, 5, 6, 7, 8, 9, 11, 12, 13
#         )
#   Mental Model:
#     Given an input integer 'year', return the century it's in with the appropriate
#     suffix (ie 'th', 'nd', 'rd', etc.)

# E:
puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10_103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11_201) == '113th'

# D:
#   In: Positive integer 'year'
#   Out: String 'century'
