# Source: https://launchschool.com/exercises/864acdb4

def time_of_day(mins)
  return '00:00' if mins.zero?

  hrs_out, min_out = mins.divmod(60)
  hrs_out %= 24 # To account for more than one day

  format('%02d:%02d', hrs_out, min_out)
end

# P:
#   Question:
#     Write a method that takes a time using this minute-based format and returns
#     the time of day in 24 hour format (hh:mm).
#   Rules/Reqs:
#     Your method should work with any integer input.
#     You may not use ruby's Date and Time classes.
#   IO:
#     In: Integer, representing "minutes"
#     Out: Interpolated string of hours and minutes: "#{hh}:#{mm}"
#   Mental Model:
#     Given an input of minutes, either positive or negative, calculate the time
#     of day in 24 hour format. Negative goes back from midnight.

# E:
#   Test Cases:
puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# D:
#   Structure: We'll use integer math and string interpolation

# A (Pseudocode):
#   Given an input of total minutes
#   Return "00:00" if input is zero
#   Else if input is positive
#     set 'min_out' to minutes % 60
#     set 'hrs_out' to minutes / 60
#       prepend a 0 if hrs_out.digits.size equals 1
#   Else
#     set 'min_out' to 60 - (minutes % 60)
#     set 'hrs_out' to 23 - (minutes / 60)
#       prepend a 0 if hrs_out.digits.size equals 1
#   Return "#{hrs_out}:#{min_out}"
