# Source: https://launchschool.com/exercises/d5c51b39

# Q: Write a method that counts the number of occurrences of each element
#    in a given array. Once counted, print each element alongside the number of
#    occurrences.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
def count_occurrences(vehicles)
  raise ArgumentError, 'Input array must be contain at least one element' unless vehicles.size.positive?

  vehicle_count = {} # create a hash to fill with counted values
  vehicles.uniq.each { |x| vehicle_count[x] = 0 } # create new elements in hash
  vehicles.each { |x| vehicle_count[x] += 1 } # increment hash
  vehicle_count.each { |k, v| puts "#{k} => #{v}" } # puts results with \n
end

count_occurrences(vehicles)

# P: For an array of elements, get all unique elements and count how many times
#    they feature in the original array. The words are case sensitive. Print
#    each element alongside its count of occurances.

# E: car => 4, truck => 3, SUV => 1, motorcycle => 2
#    count_occurences(['car', 'CaR', 'cAr']) => car => 1, CaR => 1, cAr => 1
#    count_occurences([]) => ArgumentError, Please enter an array of size > 0

# D: Our input is an array of strings
#    Our output is printed key/value pairs from a hash count table

# A: Read in an array of strings
#    Create a new array, without duplicates
#    From that new array, construct a hash using the unique array elements
#    For each element in the original array, access its hash entry and increment
#    Print key, value for each item in the hash
