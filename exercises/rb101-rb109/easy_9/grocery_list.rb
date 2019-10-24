# Source: https://launchschool.com/exercises/c1dfffc8

def buy_fruit(fruit_arr)
  itemized = []

  fruit_arr.each do |item|
    fruit, amt = item[0], item[1]
    amt.times { itemized << fruit}
  end

  itemized
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
