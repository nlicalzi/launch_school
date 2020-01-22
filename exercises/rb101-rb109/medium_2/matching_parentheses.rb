# Source: https://launchschool.com/exercises/f3d7f26e

# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(str)
  open_count = 0
  parens_only = str.scan(/[()]/) # filter string down to array of parentheses

  parens_only.each do |paren|
    if paren == '('
      open_count += 1 # add an open paren to the count
    else
      return false if open_count.zero? # if no open paren (unpaired) -> false
      open_count -= 1 # subtract one open paren from the count
    end
  end

  open_count.zero? # is our open count back down to 0?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
