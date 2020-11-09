# Source: https://launchschool.com/exercises/90d719d7

# Q: Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the tip
# and the total amount of the bill.

def prompt(message)
  puts "=> #{message}"
end

prompt('How much was the bill?')
cost = gets.chomp.to_f

prompt('Please enter a tip percentage below:')
tip_pct = gets.chomp.to_f

prompt('Great! Calculating now...')

tip = cost * (tip_pct / 100)

prompt("Total: $#{format('%.2f', cost + tip)}, " \
        "with a tip of $#{format('%.2f', tip)}!")

# P: Prompt the user to submit both their bill amount and the tip percentage
# they would like to pay. Compute tip as a percentage of bill total, and then
# display both the tip and the total payment (tip + bill total).

# E:

# D:
#   in: bill: float
#       tip: float
#   out: interpolated string

# A:
