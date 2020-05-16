# source: https://launchschool.com/exercises/82b73047

# Q: Write a minitest assertion that will fail unless `employee.hire` raises
# a `NoExperienceError` exception

def test_hire
  assert_raises(NoExperienceError) { |employee| employee.hire }
end