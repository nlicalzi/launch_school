# Colorful Things, Debugging, Ruby Basics, Exercises

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i == things.length # Changed `>` to `=`

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

# The issue is we have a mismatch in array lengths for `colors` and `things`.
# `colors` has 8 objects, while `things` only contains 7. Our break statement
# should also be changed from `>` to `==`, because arrays have zero-based indices, 
# and the last loop otherwise results in colors[8], which doesn't exist.
