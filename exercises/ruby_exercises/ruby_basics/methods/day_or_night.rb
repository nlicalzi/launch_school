# Day or Night?, Methods, Ruby Basics, Exercises

def time_of_day(input_bool)
  input_bool ? (puts "It's daytime!") : (puts "It's nighttime!")
end

daylight = [true, false].sample

time_of_day(daylight)
