# source: https://launchschool.com/exercises/e1183a98

# Q: Write a minitest assertion that will fail if value is not nil.

def test_nil 
  assert_nil value         # option 1
  assert_equal nil, value  # option 2
end