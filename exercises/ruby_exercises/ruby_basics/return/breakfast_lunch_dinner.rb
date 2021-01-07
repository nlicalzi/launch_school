# Breakfast, Lunch, or Dinner? (Pt. 1), Return, Ruby Basics, Exercises

# The code below will print 'Breakfast'.

#def meal
#  return 'Breakfast'
#end
#
#puts meal

# Pt. 2

# The code below will print 'Evening', because a Ruby definition will
# return the final line without an actual `return` being inserted

# def meal
#   'Evening'
# end
#
# puts meal

# Pt. 3

# The code below will print 'Breakfast', since there is a return statement, regardless
# of what comes after it, that will evaluate first and end the method invocation.

# def meal
#   return 'Breakfast'
#   'Dinner'
# end
#
# puts meal

# Pt. 4

# The code below will print `Dinner` \n `Breakfast`, since the puts is evaluated
# before the return statement, which then gets printed thanks to the puts on line 6

# def meal
#   puts 'Dinner'
#   return 'Breakfast'
# end
#
# puts meal

# Pt. 5

# The code will print 'Dinner' \n 'nil', because the puts in the method is evaluated, 
# but the method itself returns nil since puts returns nil, and it is printed on line 6

# def meal
#   'Dinner'
#   puts 'Dinner'
# end
#
# p meal

# Pt. 6

# The code will print 'Breakfast', since it evaluates the return line and then exits

# def meal
#   return 'Breakfast'
#   'Dinner'
#   puts 'Dinner'
# end
#
# puts meal
