# Source: https://launchschool.com/exercises/fd6b285b

def multiply_all_pairs(arr_1, arr_2)
results = []
  arr_1.each do |val_1|
    arr_2.each do |val_2|
      results << val_1 * val_2
    end
  end
results.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
