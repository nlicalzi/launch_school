# Source: https://launchschool.com/exercises/4a28f116

# def multiply_list(arr1, arr2)
#   results = []
#
#   arr1.each_with_index do |val, idx|
#     results << val * arr2[idx]
#   end
#
#   results
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |subarr| subarr.inject(:*) }
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
