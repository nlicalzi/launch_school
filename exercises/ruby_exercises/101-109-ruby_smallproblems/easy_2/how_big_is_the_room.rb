# Source: https://launchschool.com/exercises/7fc5d216

# Q: Build a program that asks user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

SQUARE_METERS_TO_SQUARE_FEET = 10.7639

def prompt(message)
  puts "=> #{message}"
end

def valid_measurement?(input)
  (input.to_i.to_s == input) && input.to_i.positive? && !input.to_s.length.zero?
end

length = ''
width = ''

loop do
  prompt('Please enter the length of your room (in meters) below:')
  length = gets.chomp
  if valid_measurement?(length)
    break
  else
    prompt("Sorry, #{length} is an invalid input...")
  end
end

loop do
  prompt('Please enter the width of your room (in meters) below:')
  width = gets.chomp
  if valid_measurement?(width)
    break
  else
    prompt("Sorry, #{width} is an invalid input...")
  end
end

square_meters = length.to_i * width.to_i
square_feet = square_meters * SQUARE_METERS_TO_SQUARE_FEET

prompt("The room is #{square_meters.round(1)} M2 / #{square_feet.round(1)} SF!")

# P: Request two floats (in Meters) from user: Length and Width of a given room.
# Multiply Length by Width to get Square Meters, divide Square Meters by 10.7639
# to get Square Feet. Display room area in Square Meters and Square Feet.

# E:
# room_length("10 feet") => invalid
# room_length("10") => valid (do input.to_s.to_i == input.to_s to validate)
# room_length() => invalid, input.to_s.length.zero? to ensure an arg is passed
# room_length(5.5) => valid
# room_length(-5) => invalid
# room_length(0) => invalid (do !(input.to_i == 0) to ensure no division by 0)

# D:
#   in: numeric
#   out: interpolated string

# A:
#   Request input for length
#     Ensure it is numeric and positive
#   Request input for width
#     Ensure it is numeric and positive
#   Multiply length and width, assign to square_meters
#   Multiply square_meters by 10.7639, assign to square_feet
#   Display square_meters and square_feet
