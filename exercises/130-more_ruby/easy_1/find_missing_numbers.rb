# Source: https://launchschool.com/exercises/a0a4a3d4

def missing(arr)
  out = []
  (arr.first..arr.last).each do |num|
    out << num unless arr.include?(num)
  end
  out
end

def further_exploration(arr)
  (arr.first..arr.last).to_a - arr
end

puts "Original prompt:"
puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []

puts "\nFurther exploration:"
puts further_exploration([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts further_exploration([1, 2, 3, 4]) == []
puts further_exploration([1, 5]) == [2, 3, 4]
puts further_exploration([6]) == []
