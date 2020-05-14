# Source: https://launchschool.com/exercises/1e706bb0

def compute
  return 'Does not compute.' unless block_given?
  yield
end

def compute_plus(arg)
  block_given? ? yield(arg) : "Does not compute."
end

puts "Original prompt:"
puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

puts "\nFurther exploration:"
puts compute_plus(8) { |num| num * 2 } == 16
puts compute_plus('abc') { |text| text.upcase } == 'ABC'
puts compute_plus(true) == 'Does not compute.'
