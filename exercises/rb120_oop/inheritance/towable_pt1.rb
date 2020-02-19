# Source: https://launchschool.com/exercises/f93d4bfd

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow
