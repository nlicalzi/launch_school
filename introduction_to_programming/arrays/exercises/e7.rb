# Exercise 7, Arrays, Intro to Programming, Launch School

a = [1, 3, 5, 7, 9]

def incrementor(array)
  return array.map { |x| x+2 }
end

b = incrementor(a)

p "Original: #{a}"
p "Modified: #{b}"
