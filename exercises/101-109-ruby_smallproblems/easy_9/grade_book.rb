# Source: https://launchschool.com/exercises/063fa805

def get_grade(grade1, grade2, grade3)
  avg = (grade1 + grade2 + grade3) / 3
  case avg
  when 90..100 then 'A'
  when 80..89 then  'B'
  when 70..79 then  'C'
  when 60..69 then  'D'
  else              'F'
  end
end

puts get_grade(95, 90, 93) == 'A'
puts get_grade(50, 50, 95) == 'D'
