# Source: https://launchschool.com/exercises/2a5d5a4e
# Manual implementation of a bubble sort algorithm in Ruby

def bubble_sort!(array)
  until array == array.sort
    idx = 0
    until idx == array.size - 1
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
      end
      idx += 1
    end
  end
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
