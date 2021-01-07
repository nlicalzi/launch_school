# Source: https://launchschool.com/exercises/3b64283e

def interleave(first, second)
  out = []
  index = 0

  until index == first.size
    out << first[index]
    out << second[index]
    index += 1
  end

  out
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# LS Solution:
#   Use each_with_index |element, index| & append element and second[index]

# Further Exploration solution:
#   a.zip(b).flatten
