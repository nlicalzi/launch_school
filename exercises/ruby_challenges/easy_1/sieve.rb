# source: https://launchschool.com/exercises/ca16ce9f

class Sieve
  attr_reader :numbers

  def initialize(len)
    @numbers = (2..len).to_a
  end

  def primes
    numbers.each do |x|
      numbers.reject! { |el| (el % x).zero? && (el != x) }
    end
    numbers
  end
end