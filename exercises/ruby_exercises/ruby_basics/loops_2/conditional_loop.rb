process_the_loop = [true, false].sample

if process_the_loop == true
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end

# (ternary operator) alternative in one line without using a loop:
# process_the_loop ? (puts "The loop was processed!") : (puts "The loop wasn't processed!")
