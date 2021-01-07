# Counting Sheep, Return, Ruby Basics, Exercises

# Pt. 1

# The code will return the following:
# 0
# 1
# 2
# 3
# 4
# 5 (this is because the Integer#times method returns the integer it's called on

# def count_sheep
#   5.times do |sheep|
#     puts sheep
#   end
# end
# 
# puts count_sheep

# Pt. 2

# The code will print the following:
# 0
# 1
# 2
# 3
# 4
# 10 (10 is the last line of the method this time, instead of the do block)

# def count_sheep
#   5.times do |sheep|
#     puts sheep
#   end
#   10
# end
#
# puts count_sheep

# Pt. 3

# The code will print:
# 0 (because the do block is working normally)
# 1
# 2
# nil (because we break at sheep = 2, and return an empty line)

# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
# end
# 
# p count_sheep

