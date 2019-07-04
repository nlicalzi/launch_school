# Exercise 1, More Stuff, Intro to Programming, Launch School

def check_str(str_in)
  if str_in =~ /lab/
    puts str_in
  else
    puts "fail"
  end
end

check_str("laboratory")
check_str("experiment")
check_str("Pans Labyrinth")
check_str("elaborate")
check_str("polar bear")

