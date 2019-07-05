# Exercise 16, Intro to Programming, Launch School

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map! { |str| str.split(" ") } # splitting all arrays by white space in-place ('!')

a.flatten! 

p a
