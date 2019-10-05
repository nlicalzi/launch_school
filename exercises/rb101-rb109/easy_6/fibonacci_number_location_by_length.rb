# # Recursion
# def fibonacci(n)
#   return 1 unless n > 2
#   fibonacci(n - 1) + fibonacci(n - 2)
# end
#
# def find_fibonacci_index_by_length(x)
#   counter = 0
#   counter += 1 until fibonacci(counter).to_s.size >= x
#   counter
# end
#
# p find_fibonacci_index_by_length(2) == 7
# p find_fibonacci_index_by_length(3) == 12

# Looping
def find_fibonacci_index_by_length(x)
  n1 = 1
  n2 = 1
  index = 2
  until (n1 + n2).to_s.size >= x
    fibonacci = n1 + n2
    n1 = n2
    n2 = fibonacci
    index += 1
  end
  index + 1
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
