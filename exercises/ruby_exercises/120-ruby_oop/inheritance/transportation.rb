# Source: https://launchschool.com/exercises/507a7449

module Transportation
  class Vehicle
    attr_reader :year

    def initialize(year)
      @year = year
    end
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

f150 = Transportation::Truck.new(2007)
puts f150

camry = Transportation::Car.new(2010)
puts camry
