# Weather Forecase, Debugging, Ruby Basics, Exercises

def predict_weather
  sunshine = ['true', 'false'].sample # The error is that true/false here are strings, which eval to True
  # Fixed: sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end


