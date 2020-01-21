# Source: https://launchschool.com/exercises/336d2612

# Rewrite your recursive fibonacci method so that it computes its results
# without recursion (procedurally).

def fibonacci(n)
  a = 1 # avoiding parallel assignment
  b = 1 # avoiding parallel assignment
  (3..n).each do |_| # no need for named block argument
    a, b = [b, a + b]
  end
  b
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(1000)
