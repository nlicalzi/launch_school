# Source: https://launchschool.com/exercises/365dfb8b

def center_of(str)
  len = str.size
  return str[len/2] unless len.even?
  str[(len/2)-1, 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
