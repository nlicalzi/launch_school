# Source: https://launchschool.com/exercises/ec8dd514

def step(first, last, step_val)
  arr = (first..last).to_a
  counter = 0

  while counter < arr.size
    yield(arr[counter])
    counter += step_val
  end

  nil
end

puts step(1, 10, 3) { |value| puts "value = #{value}" }
