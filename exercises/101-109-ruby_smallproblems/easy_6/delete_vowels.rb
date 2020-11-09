# Source: https://launchschool.com/exercises/8fa5da79

def remove_vowels(arr)
  arr.map { |str| str.tr('AEIOUaeiou', '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
