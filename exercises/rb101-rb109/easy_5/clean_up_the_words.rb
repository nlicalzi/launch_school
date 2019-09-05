# Source: https://launchschool.com/exercises/56e92849

def cleanup(str)
  str.gsub(/[^a-z]/i, ' ').squeeze('  ')
end

cleanup("---what's my +*& line?") == ' what s my line '
