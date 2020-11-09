# source: https://launchschool.com/exercises/eaa85d07

# Q: Write a minitetst assertion that will fail if the Array `list` is not empty.

def test_empty
  assert_empty list              # option 1
  assert_equal true, list.empty? # option 2
end