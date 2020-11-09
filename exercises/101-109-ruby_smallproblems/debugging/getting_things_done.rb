# Source: https://launchschool.com/exercises/9e40881a

def move(n, from_array, to_array)
  n.times do
    to_array << from_array.shift
  end
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# The original LS solution fell into an infinite recursion loop
# because there was no break specified.
