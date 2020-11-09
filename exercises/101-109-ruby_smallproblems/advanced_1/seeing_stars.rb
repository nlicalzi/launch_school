# Source: https://launchschool.com/exercises/facfe405
# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

def star(n)
  max = "*" + " " * ((n-3)/2) + "*" + + " " * ((n-3)/2) + "*"
  arr = [max]
  mid = "*" * n # middle row

  (1..(n/2 - 1)).each do |idx|
    str = arr[idx - 1].dup # make a copy so we don't mutate original array el
    str[idx], str[idx - 1] = str[idx - 1], str[idx] # swap chars from left side
    str[-idx], str[-idx - 1] = str[-idx - 1], str[-idx] # swap chars from right side
    arr << str # append swapped string and increment array
  end

  arr.each { |el| puts el}
  puts mid
  arr.reverse.each { |el| puts el}
  nil
end

star(7)
star(9)
