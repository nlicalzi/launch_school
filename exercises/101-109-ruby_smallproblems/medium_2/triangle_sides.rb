# Source: https://launchschool.com/exercises/7fe5eaf8

# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
# :invalid depending on whether the triangle is equilateral, isosceles,
# scalene, or invalid.

def triangle(a, b, c)
  return :invalid if [a, b, c].any?(&:zero?) # if any length is 0
  return :invalid unless [a, b, c].sort[0..1].sum > [a, b, c].max # sum of smaller > largest
  return :equilateral if a == b && b == c # if all sides are the same length
  return :isosceles if [a, b, c].uniq.size == 2 # if one length is repeated 2x
  :scalene # all other valid triangles
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
