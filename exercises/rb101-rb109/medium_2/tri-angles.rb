# Source: https://launchschool.com/exercises/1d04b607

# Write a method that takes the 3 angles of a triangle as arguments, and
# returns a symbol :right, :acute, :obtuse, or :invalid depending on whether
# the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about
# floating point errors. You may also assume that the arguments are specified
# in degrees.

def triangle(a, b, c)
  angles = [a, b, c]
  return :invalid unless angles.sum == 180 && angles.none?(&:zero?) # no 0s and sum to 180
  return :right if angles.any? { |x| x == 90 }
  return :obtuse if angles.any? { |x| x > 90 }
  :acute
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
