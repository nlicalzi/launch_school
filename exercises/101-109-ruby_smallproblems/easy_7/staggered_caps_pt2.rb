# Source: https://launchschool.com/exercises/6eb02aae

def staggered_case(str)
  result = ''
  upcase_char = true
  str.chars.each do |char|
    if upcase_char && char =~ /[a-zA-Z]/
      result += char.upcase
      upcase_char = !upcase_char
    elsif char =~ /[a-zA-Z]/
      result += char.downcase
      upcase_char = !upcase_char
    else
      result += char
    end
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
