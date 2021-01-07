# Source: https://launchschool.com/exercises/6990f3dc

def rot_13(str)
  alpha_lower = ('a'..'z').to_a
  alpha_upper = alpha_lower.map(&:upcase)
  rot_lower = alpha_lower.rotate(13)
  rot_upper = alpha_upper.rotate(13)

  str.chars.map do |char|
    if alpha_lower.include?(char)
      rot_lower[alpha_lower.find_index(char)]
    elsif alpha_upper.include?(char)
      rot_upper[alpha_upper.find_index(char)]
    else
      char
    end
  end.join
end

File.readlines('encrypted_pioneers.txt').each do |line|
  puts rot_13(line)
end

