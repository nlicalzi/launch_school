# Source: https://launchschool.com/exercises/eec5e591

def reverse!(list)
  reversed = []
  list.each { |x| reversed.unshift(x) }
  list.clear
  reversed.each { |x| list << x}
end

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
puts list == ["abc"]

list = []
reverse!(list) == []
puts list == []
