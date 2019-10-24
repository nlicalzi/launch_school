# Source: https://launchschool.com/exercises/02350925

def sequence(count, num)
  (1..count).to_a.map { |x| num * x }
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1_000_000) == []
