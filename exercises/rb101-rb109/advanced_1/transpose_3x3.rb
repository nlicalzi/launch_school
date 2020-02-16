# Source: https://launchschool.com/exercises/01d32e03

def transpose(matrix)
  transposed = []
  (0..2).each do |idx|
    row = []
    matrix.each do |arr|
      row << arr[idx]
    end
    transposed << row
  end
  transposed
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
