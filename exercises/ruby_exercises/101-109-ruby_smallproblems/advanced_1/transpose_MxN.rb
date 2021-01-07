# Source: https://launchschool.com/exercises/ff9b13b6

def transpose(matrix)
  rows = matrix[0].size

  transposed = []
  (0..rows-1).each do |idx|
    row = []
    matrix.each do |arr|
      row << arr[idx]
    end
    transposed << row
  end
  transposed
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
