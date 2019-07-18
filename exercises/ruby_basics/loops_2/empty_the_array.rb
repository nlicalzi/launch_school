names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop # further exploration: names.shift removes from beginning
  break if names.empty? 
end
