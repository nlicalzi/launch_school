# Source: https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a

require 'minitest/autorun'

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

class CarTest < MiniTest::Test
  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey") # passes if ArgError is raised
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car) # useful for inheritance
  end

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end

  # assert_includes calls assert_equal in its implementation, and Minitest counts
  # that call as a separate assertion. For each assert_includes call, you will
  # get 2 assertions, not 1.
end
