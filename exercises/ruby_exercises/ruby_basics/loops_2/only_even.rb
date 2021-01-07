number = 0

until number == 10
  number += 1
  # we could remove the if statement below and make this line `next if number.odd?`"
  puts number if number.even?
end
