# Source: https://launchschool.com/exercises/56e92849

def swap(sentence)
  words = sentence.split(' ')
  words.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
