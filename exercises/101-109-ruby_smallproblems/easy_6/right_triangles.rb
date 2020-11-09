# Source: https://launchschool.com/exercises/d165e3c4

def triangle(num)
  counter = 1
  num.times do
    p ("*" * counter).rjust(num)
    counter += 1
  end
end

triangle(5)
triangle(9)

# P:
#   Question:
#     Write a method that takes a positive integer, n, as an argument, and
#     displays a right triangle whose sides each have n stars. The hypotenuse of
#     the triangle (the diagonal side in the images below) should have one end at
#     the lower-left of the triangle, and the other end at the upper-right.
#   Rules/Reqs:
#     Can we assume the minimum input n is 3? (to form a triangle)
#   IO:
#     In: Integer 'n'
#     Out: 'n' printed lines of right justified *s
# E:
#   Test Cases:
# D:
#   Structure:
# A (Pseudocode):
#   Given an integer `n`
#   set 'counter' to 1
#   print 'n' lines, each consisting of
#     'counter' right justified *s, with n total chars
