# source: https://launchschool.com/exercises/d69b88d6

# Q: Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

def test_downcase
  assert_equal 'xyz', value.downcase
end