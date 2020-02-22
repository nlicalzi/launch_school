# Source: https://launchschool.com/exercises/7b713134

class Transform
  def initialize(msg)
    @msg = msg
  end

  def uppercase # instance method
    @msg.upcase
  end
  
  def self.lowercase(str) # class method
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
