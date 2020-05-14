# https://launchschool.com/exercises/d5c51b39

# Q: Write a method that counts the number of occurrences of each element in a
# given array

def count_occurrences(arr)
  count = {}
  arr.uniq.each { |x| count[x] = arr.count(x) }
  pp count
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
