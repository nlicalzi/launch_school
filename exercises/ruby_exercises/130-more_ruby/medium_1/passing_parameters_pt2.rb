# source: https://launchschool.com/exercises/8621919c

# ignore first 2 elements in array, group rest as Array `raptors`
birds = %w(crow finch hawk eagle)

def classify_birds(birds)
  yield(birds)
end

raptors = classify_birds(birds) { |birds| birds[2..-1] }
p raptors


classify_birds(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end