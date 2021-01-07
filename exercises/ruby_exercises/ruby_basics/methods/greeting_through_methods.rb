# Greeting Through Methods (Part 1), Methods, Ruby Basics, Exercises

def say_hello
  "Hello"
end

def say_world
  "World"
end

#puts "#{say_hello} #{say_world}"

# Pt. 2

def greet
 say_hello + " " + say_world
end

puts greet
