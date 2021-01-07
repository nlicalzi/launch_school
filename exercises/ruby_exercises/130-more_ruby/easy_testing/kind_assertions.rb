# source: https://launchschool.com/exercises/098fba0b

# Q: Write a minitest assertion that will fail if the class of value is not
# Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

def test_kind_of_value
  assert_kind_of(Numeric, value)
end
