# Exercise 4, Loops and Iterators, Intro to Programming, Launch School

def count_down(input=10)
  p "Counting down from #{input}"

  if input > 0
    puts count_down(input - 1)
  end

end

count_down
count_down(5)
