# Source: https://launchschool.com/exercises/c6c0d9a9

def count(*args)
  count = 0
  args.to_a.each { |el| count += 1 if yield(el) }
  count
end

p count(1, 3, 6) { |value| value.odd? } == 2
puts count(1, 3, 6) { |value| value.even? } == 1
puts count(1, 3, 6) { |value| value > 6 } == 0
puts count(1, 3, 6) { |value| true } == 3
puts count() { |value| true } == 0
puts count(1, 3, 6) { |value| value - 6 } == 3
