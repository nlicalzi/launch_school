# Source: https://launchschool.com/exercises/ba434183

def running_total(input_array)
  accumulator = 0
    input_array.map { |x| accumulator += x }
end

# P:
#   Question:
#     Write a method that takes an Array of numbers, and returns an Array with
#     the same number of elements, where each element has the running total from
#     the original Array.
#   IO:
#     In: Array of integers
#     Out: Modified array of integers
#   Rules/Reqs:
#     Should support arrays of all lengths (incl. 0 and 1)
# Mental Model:
#     Given an input array of numbers [x, y, z...], return an array where the item
#     at each index represents the running sum (index i + index i-1).

# E:
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# D:
#   Use an array and iterate over each element, respective of indices?

# A:
#   Accept an 'input' of an array of numbers
#   If the array has size < 2:
#     Return the array
#   Else:
#     For each index in the array
#       Add the object at the index with the object at the previous index
#           (array[x] + array[x-1])
