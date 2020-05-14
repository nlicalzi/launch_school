# Source: https://launchschool.com/exercises/90d719d7

# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

def tip_calculator
  print "What is the bill?\n=> $"
  bill = gets.to_f

  print "What is the tip percentage?\n=> "
  pct = gets.to_f

  tip_amt = ((pct / 100) * bill).round(2)
  total = bill + tip_amt
  puts "The tip is $#{tip_amt}"
  puts "The total is $#{total.round(2)}"
end

tip_calculator
