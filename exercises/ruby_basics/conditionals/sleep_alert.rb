# Sleep Alert, Conditionals, Ruby Basics, Exercises

status = ['awake', 'tired'].sample

alert = if status == 'awake'
          'Be Productive!'
        else 'Go to sleep!'
        end

puts alert
