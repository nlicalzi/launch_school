# Source: https://launchschool.com/exercises/ef2226a5

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
