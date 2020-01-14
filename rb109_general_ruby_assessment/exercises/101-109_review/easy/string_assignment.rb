# Source: https://launchschool.com/exercises/a12ef94e

# Annotate the code below and predict what it will output

name = 'Bob' # We initialize the local variable 'name' and set it to the string object 'Bob'
save_name = name # We initialize the local variable 'save_name' and point it to 'name'
name.upcase! # We call the mutating form of the upcase String method on the object that 'name' is pointing to
puts name == 'BOB' && save_name == 'BOB' # Both name and save_name continue pointing to the mutated string 'BOB'
