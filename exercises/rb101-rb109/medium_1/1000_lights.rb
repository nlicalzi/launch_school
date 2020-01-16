# Source: https://launchschool.com/exercises/61d687f4

def toggle(switch)
  switch.zero? ? 1 : 0 # if arg == 0, return 1, else 0
end

def toggle_switches(n)
  lights = [0] * n # initialize 'lights' array with n zeroes
  (1..n).each do |pass_num| # for each pass in our pass_numbers
    # reassign our array, using the ternary operator method to toggle
    # the light if the index + 1 is divisible by pass_num
    lights = lights
             .each_with_index
             .map { |x, i| ((i + 1) % pass_num).zero? ? toggle(x) : x }
  end
  # select indices where arr = 1 and add 1 to each index (0-based to 1-based)
  lights.each_index.select { |i| lights[i] == 1 }.map { |x| x + 1 }
end

puts toggle_switches(5) == [1, 4]
puts toggle_switches(10) == [1, 4, 9]
