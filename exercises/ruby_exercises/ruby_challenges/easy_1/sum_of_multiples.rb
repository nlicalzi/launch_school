# source: https://launchschool.com/exercises/780205f1

class SumOfMultiples
  def self.to(end_num, divisors = [3, 5]) # default devisor arg, can be overwritten
    (1..(end_num - 1)).select do |el|
      divisors.any? { |divisor| (el % divisor).zero? }
    end.sum
  end

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(end_num)
    self.class.to(end_num, @divisors)
  end
end