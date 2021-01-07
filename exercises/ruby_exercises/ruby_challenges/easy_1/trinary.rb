# source: https://launchschool.com/exercises/a74a58d6

class Trinary
  attr_accessor :digits

  def initialize(str)
    @digits = str.chars
  end

  def to_decimal
    return 0 if digits.join =~ /[^0-2]/
    # could also do: return 0 if digits.match(/[^0-2]/)
    digits.reverse\
          .each_with_index\
          .map { |el, idx| el.to_i * (3 ** idx) }
          .sum
  end
end
