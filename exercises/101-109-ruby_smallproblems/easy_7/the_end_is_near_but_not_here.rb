# Source: https://launchschool.com/exercises/8332cd47

def penultimate(str)
  str.split[-2]
end

puts penultimate('last word') #== 'last'
puts penultimate('Launch School is great!') #== 'is'
