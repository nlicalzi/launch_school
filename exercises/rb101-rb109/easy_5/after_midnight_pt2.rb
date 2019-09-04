# Source: https://launchschool.com/exercises/34f92353

def after_midnight(time)
  return 0 if time == '24:00' || time == '00:00'
  hours, minutes = time.split(':').map(&:to_i)
  (hours * 60) + minutes
end

def before_midnight(time)
  return 0 if time == '24:00' || time == '00:00'
  1440 - after_midnight(time)
end

# P:
#   Question:
#     Write two methods that each take a time of day in 24 hour format, and
#     return the number of minutes before and after midnight, respectively.
#   Rules/Reqs:
#     Both methods should return a value in the range 0..1439.
#     '24:00' should return 0, regardless of it being an invalid time.
#       Use a guard clause for this?
#     1439 minutes in 23h59m
#   IO:
#     In: String formatted thusly: 'hh:mm'
#     Out: Integer representing total minutes
#   Mental Model: n/a

# E:
#   Test Cases:
puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# D:
#   Structure: We'll work with integers, no need for a collection.

# A (Pseudocode):
#   Accept a string representation of 24h time: 'hh:mm'
#   If input is 24:00 or 00:00, return 0
#   Split the string by the colon to array split_time
#     0 index of split_time is hours
#     1 index of split_time is minutes
#   Set total_minutes to (hours * 60) + minutes
#   For after_midnight:
#     return total_minutes
#   For before_midnight:
#     return 1440 - total_minutes
#
