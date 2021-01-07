# Digit PRoduct, Debugging, Ruby Basics, Exercises

def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1 # product = 0 was our issue, anything multiplied by 0 will equal 0

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0
