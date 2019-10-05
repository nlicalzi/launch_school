# Source: https://launchschool.com/exercises/054baaef

DEGREE = "\xC2\xB0"

def dms(angle)
  degrees = angle.to_i
  minutes = ((angle - degrees) * 60)
  seconds = ((minutes - minutes.to_i) * 60)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# P:
#   Question:
#     Given a floating point number between 0 and 360, return a string representation
#     of that angle in degrees, minutes, and seconds.
#   Rules/Reqs:
#     format: xx°xx'xx"
#     input is a float between 0 and 360
#   IO:
#     In: floating point number
#     Out: string
#   Mental Model:
# E:
#   Test Cases:
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# D:
#   Structure: string interpolation
# A (Pseudocode):
# accept input angle for conversion (can assume float btw 0 and 360)
#
# initialize variable `degrees` and set to user_input converted to an integer
# initialize variable `minutes` and set it to ((user_input - degrees) * 60)
# initialize variable `seconds` and set it to ((degrees - minutes) * 60)
#
# return interpolated string "#{degrees}°#{minutes.to_i}'#{seconds.to_i}#{DOUBLE_QUOTE}"
