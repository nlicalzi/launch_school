# Passwords, User Input, Ruby Basics, Exercises

PASSWORD = "hunter2"

def pw_prompt
  loop do
    puts ">> Please enter your password:"
    attempt = gets.chomp.to_s
    break if attempt == PASSWORD
    puts ">> Invalid password!"
  end

  puts "Welcome!"
end

pw_prompt
