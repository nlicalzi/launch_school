# Source: https://launchschool.com/exercises/eec5e591

def reverse!(arr)
  left_index = 0
  right_index = -1

  until left_index >= arr.size / 2
    arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
    left_index += 1
    right_index -= 1
  end
  arr
end

list = [1, 2, 3, 4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b e d c)
puts reverse!(list) == %w(c d e b a)
puts list == %w(c d e b a)

list = ['abc']
puts reverse!(list) == ['abc']
puts list == ['abc']

list = []
puts reverse!(list) == []
puts list == []
