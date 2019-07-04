# Exercise 6, Hashes, Intro to Programming, Launch School

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {}

words.each do |word| 
  sorted = word.split('').sort.join
  if result.has_key?(sorted)
    result[sorted].push(word)
  else
    result[sorted] = [word]
  end
end

result.each_value { |v| p v }
