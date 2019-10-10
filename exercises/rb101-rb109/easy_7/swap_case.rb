# Source:

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def swapcase(str)
  index = 0
  until index == str.size
    if LOWERCASE.include?(str[index])
      str[index] = UPPERCASE[LOWERCASE.index(str[index])]
    elsif UPPERCASE.include?(str[index])
      str[index] = LOWERCASE[UPPERCASE.index(str[index])]
    else
    end
    index += 1
  end
  str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
