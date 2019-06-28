def add_three(number)
  return number + 3
  number + 4
end

returned_value = add_three(4)
puts returned_value

# This will still return 7, because the "return" line overrides the default "last line" return evaluation
# Return is NOT REQUIRED, as the method will otherwise return the last line. One-liners are fine
