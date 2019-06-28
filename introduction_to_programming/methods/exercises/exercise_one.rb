# A program that prints a greeting message
# Response to Exercise One of Methods section in Intro to Programming @ Launch School

def greeting(name="Default")
  p "Hey there, #{name}!"
  name.to_s
end

greeting("Mark")
greeting("Nicholas")
greeting(423426) # edge case
greeting() # edge case
