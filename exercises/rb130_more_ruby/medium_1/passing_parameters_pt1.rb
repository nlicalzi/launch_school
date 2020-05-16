# Source: https://launchschool.com/exercises/c7f39d55

items = %w(apples corn cabbage wheat)

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(crops) { |crops| puts crops.join(', ') }