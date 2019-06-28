# Exercise 1, Flow Control, Intro to Programming, Launch School

q1 = "(32 * 4) >= 129"
q2 = "false != !true"
q3 = "true == 4"
q4 = "false == (847 == '847')"
q5 = "(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false"

p "Q1: #{q1} should evaluate to false"
p "Q1 is #{((32 * 4) >= 129)}"

p "Q2: #{q2} should evaluate to false"
p "Q2 is #{false != !true}"

p "Q3: #{q3} should evaluate to false"
p "Q3 is #{true == 4}"

p "Q4: #{q4} should evaluate to true"
p "Q4 is #{false == (847 == '847')}"

p "Q5: #{q5} should evaluate to true" 
p "Q5 is #{(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false}"
