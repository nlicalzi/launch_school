# Source: https://launchschool.com/exercises/7c6be14d

def zip(arr_1, arr_2)
  out = []
  0.upto(arr_1.size - 1) do |idx|
    out << [arr_1[idx], arr_2[idx]]
  end
  out
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
