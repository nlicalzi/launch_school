# Stoplight, Conditionals, Ruby Basics, Exercises

stoplight = ['green', 'yellow', 'red'].sample

# Pt. 1

#case stoplight
#when 'green'
#  puts 'Go!'
#when 'yellow'
#  puts 'Slow down!'
#when 'red'
#  puts 'Stop!'
#end

# Pt. 2

#if stoplight == 'green'
#  puts 'Go!'
#elsif stoplight == 'yellow'
#  puts 'Slow down!'
#else
#  puts 'Stop!'
#end

# Pt. 3

case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end
