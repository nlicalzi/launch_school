NUM = 5837

first = NUM / 1000

second = (NUM%1000) / 100

third = (NUM%100) / 10

last = NUM % 10 

return_string = "The first digit is #{first}, the second is #{second}, the third is #{third}, and the fourth is #{last}!"

puts return_string
