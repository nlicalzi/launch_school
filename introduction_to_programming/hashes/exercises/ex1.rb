# Exercise 1, Hashes, Intro to Programming, Launch School

family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"],
           brothers: ["frank", "rob", "david"],
           aunts: ["mary", "sally", "susan"]
         }

immediate = Array([family[:brothers].to_a, family[:sisters].to_a]).flatten 

p immediate
