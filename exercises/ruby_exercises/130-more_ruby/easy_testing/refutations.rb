# source: https://launchschool.com/exercises/4ac8e502

# Q: Write a test that will fail if 'xyz' is one of the elements in the Array `list`:

def test_not_included
  refute_includes(list, 'xyz')
end