# Exercise 9, Intro to Programming, Launch School

h = {a:1, b:2, c:3, d:4}

puts h[:b]

puts h[:e] = 5

h.delete_if { |k,v| v < 3.5 }

puts h
