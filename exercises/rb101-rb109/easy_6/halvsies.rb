# Source: https://launchschool.com/exercises/d9b79537

def halvsies(arr)
  return [[], []] if arr.empty?
  midpoint = (arr.size / 2.0).ceil # this lets us round up
  first = arr.slice(0, midpoint)
  second = arr.slice(midpoint, (arr.size - midpoint))
  [first, second]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
