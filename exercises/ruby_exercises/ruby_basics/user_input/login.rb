# User Name and Password, User Input, Ruby Basics, Exercises

USERNAME = "nlicalzi"
PASSWORD = "hunter2"

def check_username
  puts ">> Please enter user name:"
  input_username = gets.chomp.to_s
  input_username == USERNAME
end

def check_password
  puts ">> Please enter password:"
  input_password = gets.chomp.to_s
  input_password == PASSWORD
end

def attempt_login
  loop do
    valid_user = check_username
    valid_pass = check_password
    break if valid_user && valid_pass
    puts ">> Authorization failed!"
  end
  puts "Welcome!"
end

attempt_login

