# Source: https://launchschool.com/exercises/1ba11514

def merge(arr1, arr2)
  out = []
  (arr1 + arr2).each { |x| out << x unless out.include?(x) }
  out
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
