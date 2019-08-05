# Source: https://launchschool.com/lessons/a0f3cd44/assignments/4ad62c1d

# Q: Take everything you've learned so far and build a loan calculator.

# P: Given a loan amount, an Annual Percentage Rate (APR), and a loan duration,
#    calculate both the monthly interest rate, and loan duration in months.
#    Formula m = p * (j / (1 - (1 + j)**(-n)))
#    m = Monthly payment
#    p = loan amount
#    j = monthly interest rate
#    n = loan duration in months

# E: [to come]

# D: in:
#       loan amount (numeric)
#       APR (numeric (percentages -> 5%, not 0.05))
#       loan duration (int (months))

# A:
#   Request loan amount (specify both int and float accepted)
#     Validate input
#   Request APR (specify format: xx.x%, not 0.05)
#     Validate input (>1? >.5?) [are you sure that's right? => accept/re-enter]
#   Request loan duration (int, in months)
#     Validate input (perhaps we can accept years as well?)
#   Calculate monthly interest rate: APR/loan duration
#   Calculate monthly payment using provided formula
