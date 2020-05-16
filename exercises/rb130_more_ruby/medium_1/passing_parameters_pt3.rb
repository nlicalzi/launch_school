# source: https://launchschool.com/exercises/c9181c33

items = %w(apples corn cabbage wheat)

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

puts "Q1:"
gather(items) do | *first_three, last |
  puts first_three.join(', ')
  puts last
end

puts "\nQ2:"
gather(items) do | first, *mid, last |
  puts first
  puts mid.join(', ')
  puts last
end

puts "\nQ3:"
gather(items) do | first, *rest |
  puts first
  puts rest.join(', ')
end

puts "\nQ4:"
gather(items) do | first, second, third, fourth |
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end