# Source: https://launchschool.com/exercises/2dd79c4e

def fibonacci_last(n)
  a = 1 # avoiding parallel assignment
  b = 1 # avoiding parallel assignment
  (3..n).each do |_| # no need for named block argument
    a, b = [b, a + b]
  end
  b % 10
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)

# LS SOLUTION:
# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end
