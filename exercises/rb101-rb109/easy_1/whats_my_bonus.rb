# Source: https://launchschool.com/exercises/ff309c91

# Q: Write a method that takes two arguments, a positive integer and a boolean,
#    and calculates the bonus for a given salary. If the boolean is true, the
#    bonus should be half of the salary. If the boolean is false, the bonus
#    should be 0.

def calculate_bonus(salary, did_well)
  did_well ? salary/2 : 0
end
# P: Write a method that accepts a positive integer (salary) and a boolean
#    value (bonus/not_bonus). If boolean, return salary/2, else return 0.

# E:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# D: in: positive integer, boolean
#    out: integer

# A: If boolean, return salary/2, else return 0.
