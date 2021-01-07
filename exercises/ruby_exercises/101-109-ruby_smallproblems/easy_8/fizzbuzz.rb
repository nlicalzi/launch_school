# Source: https://launchschool.com/exercises/f1c61d35

def fizzbuzz(a, b)
  arr = (a..b).to_a
  arr.each do |num|
    case
      when (num % 3).zero? && (num % 5).zero?
        puts "FizzBuzz"
      when (num % 3).zero?
        puts "Fizz"
      when (num % 5).zero?
        puts "Buzz"
      else
        puts num
    end
  end
end

fizzbuzz(1, 15)
