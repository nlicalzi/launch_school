# Exercise 4, Methods, Intro to Programming, Launch School

line1 = "That code block won\'t print anything, because it uses 'return' on an otherwise empty line"
line2 =  "The method was meant to append four exclamation points after an input string"
line3 =  "It can be fixed by deleting line 3 and adding a line consisting solely of 'words'"

def scream(words)
  words = words + "!!!!"
  puts words 
  words
end

scream(line1)
scream(line2)
scream(line3)
