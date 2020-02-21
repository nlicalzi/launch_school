# Source: https://launchschool.com/exercises/42f030c9

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(dimension)
    super(dimension, dimension)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"
