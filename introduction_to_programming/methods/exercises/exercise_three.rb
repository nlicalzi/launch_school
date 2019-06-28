# Exercise 3, Methods, Intro to Programming, Launch School
# A tip calculator

def multiply(num1, num2)
  num1.to_f * num2.to_f # we use to_f because we need it to be a float to handle cents!
end

def calc_tip()
  p "How much did you spend on your meal?"
  price = gets.strip.to_f
  p "Great! #{price}! And what percentage would you like to tip?"
  tip_pct = (gets.strip.to_f / 100)
  p "Tipping #{tip_pct * 100}%, alright. Let me see..."
  puts "Your total is... " + multiply(price, tip_pct + 1).to_s
  multiply(price, tip_pct + 1)
end

calc_tip

# Having an issue with rounding off our float. Will return to it!
