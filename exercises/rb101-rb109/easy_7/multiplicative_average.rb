# Source: https://launchschool.com/exercises/00ee768d

def show_multiplicative_average(arr)
  average = arr.inject(:*) / arr.size.to_f
  "The result is #{format('%.3f', average)}"
end

puts show_multiplicative_average([3, 5])
puts show_multiplicative_average([6])
puts show_multiplicative_average([2, 5, 7, 11, 13, 17])
