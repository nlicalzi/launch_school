# Source: https://launchschool.com/exercises/f9cb9ad5

def drop_while(arr)
  drop_flag = false
  out = []

  arr.each do |el|
    if drop_flag == false
      drop_flag = yield(el) ? drop_flag = false : drop_flag = true
    end
    out << el if drop_flag
  end
  out
end

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []
