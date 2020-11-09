# source: https://launchschool.com/exercises/9eed2942

# Q: Write a test that will fail if list and the return value of list.process
# are different objects.

def test_same_object
  assert_same(list, list.process)
end