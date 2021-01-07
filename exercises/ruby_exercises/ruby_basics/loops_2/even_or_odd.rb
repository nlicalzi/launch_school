count = 1

loop do
  count.even? ? (puts "#{count} is even!") : (puts "#{count} is odd!") # this is known as a ternary operator (uses 3 args)
  break if count == 5
  count += 1
end
