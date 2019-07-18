# Say Hello, Loops 1, Ruby Basics, Exercises

say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter == 5
end
