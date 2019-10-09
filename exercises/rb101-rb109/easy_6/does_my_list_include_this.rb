# Source: https://launchschool.com/exercises/860cfef1

def include?(arr, val)
  arr.map { |x| x == val ? 1 : 0 }.sum > 0
end

# LS suggeston: use !!array.find_index(value)
# Remember: double bang (!!) converts value to its boolean form

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
