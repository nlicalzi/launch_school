# Exercise 3, Hashes, Intro to Programming, Launch School

pet = {name: "Bean", species: "Cat", color: "Black", type: "American Longhair"}

pet.each_key { |k| puts "Key: #{k}" }

pet.each_value { |v| puts "Value: #{v}" }

pet.each { |k,v| puts "Key: #{k}, Value: #{v}" }
