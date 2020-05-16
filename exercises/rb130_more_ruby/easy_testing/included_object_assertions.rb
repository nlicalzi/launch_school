# source: https://launchschool.com/exercises/12b78daf

# Q: Write a minitest assertion that will fail if 'xyz' is not in the Array `list`.

def test_included
  assert_includes list, 'xyz'           # option 1, better error msgs
  assert_equal true, list.include?(xyz) # option 2, weaker than 1 
end