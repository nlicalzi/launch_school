# Source: https://launchschool.com/exercises/77884ef5

def staggered_case(str)
  str.chars.each_with_index do |val, idx|
    if idx.odd?
      val.downcase!
    else
      val.upcase!
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
