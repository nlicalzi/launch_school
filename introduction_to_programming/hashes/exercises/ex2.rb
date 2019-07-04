# Exercise 2, Hashes, Intro to Programming, Launch School

p "Ruby's merge method has two versions: 'merge' and 'merge!' the difference is:"

person = {name: 'Nick'}
person_details = { height: '6 ft', eyes: 'brown' }

p "Person: #{person}, details: #{person_details}"

p "Merged (non-destructive): #{person.merge(person_details)}, #{person}"

p "Merged (destructive): #{person.merge!(person_details)}, #{person}"
