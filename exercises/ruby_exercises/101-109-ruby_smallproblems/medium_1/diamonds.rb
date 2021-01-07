# Source: https://launchschool.com/exercises/75ff93ae

# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the
# method. You may assume that the argument will always be an odd integer.

def return_empty_spaces(total, stars_count)
  ' ' * ((total - stars_count) / 2)
end

def return_stars(n)
  '*' * n
end

def diamond(n)
  1.upto(n) do |stars|
    puts "#{return_empty_spaces(n, stars)}#{return_stars(stars)}" if stars.odd?
  end
  (n-2).downto(1) do |stars|
    puts "#{return_empty_spaces(n, stars)}#{return_stars(stars)}" if stars.odd?
  end
end

diamond(9)
