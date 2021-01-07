# Reading Error Messages, Debugging, Ruby Basics, Exercises

def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
# The above code will return an ArgumentError because there are too many arguments.
# The numbers should be contained in a single array, so only one object is passed.

find_first_nonzero_among([1])
# This code will not run because there is no "each" method for integers (NoMethod error).
# This could also be fixed by forming a array, even with just one element.
