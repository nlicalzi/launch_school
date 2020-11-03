require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! # add color to test output

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip "Testing skip for now"
    car = Car.new
    assert_equal(3, car.wheels)
  end
end
