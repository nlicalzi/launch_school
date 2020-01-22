# Source:https://launchschool.com/exercises/a7fce257

require 'date'

def friday_13th(year)
  dates = (1..12).to_a.map { |month| Date.parse("#{year}-#{month}-13") } # create dates array
  dates.select(&:friday?).size # filter for friday dates and count array size
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
