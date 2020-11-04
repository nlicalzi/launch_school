### RB120/Lesson_4 Practice Problems: Hard 1

Source: https://launchschool.com/lessons/f1c58be0/assignments/928366dd



**Q1:**

```Ruby
class SecretFile
  def initialize(secret_data, security_log)
    @data = secret_data
    @security_log = security_log
  end

  def return_secret_data
    @security_log.create_log_entry
    @data
  end
end

class SecurityLogger  
  def create_log_entry
    # code here
  end
end
```



**Q2:**

```Ruby
module Wheelable
  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  include Wheelable

  def initialize
    @tires = [30, 30, 32, 32]
    # 4 tires are various tire pressures
    super(50, 25.0)
  end
end

class Motorcycle < Vehicle
  include Wheelable
  
  def initialize
    @tires = [20, 20]
    # 2 tires are same tire pressure
    super(80, 8.0)
  end
end

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end
```