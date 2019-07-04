# Exercise 4, More Stuff, Intro to Programming, Launch School

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
