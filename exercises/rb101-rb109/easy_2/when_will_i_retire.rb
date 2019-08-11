# Source: https://launchschool.com/exercises/d28a76d4

# Q: Build a program that displays when the user will retire and how many years
#    she has to work till retirement.

CURRENT_YEAR = Time.now.year

def prompt(message)
  puts "=> #{message}"
end

loop do
  current_age = ''
  target_age = ''

  loop do
    prompt('What is your current age? (in integer form, please)')
    current_age = gets.chomp
    break if current_age.to_i.positive?
    prompt('Sorry, that answer is invalid.')
  end

  loop do
    prompt('What age would you like to be when you retire?')
    target_age = gets.chomp
    break if target_age.to_i.positive? && target_age.to_i > current_age.to_i
    prompt('Sorry, that answer is invalid.')
  end

  years_remaining = target_age.to_i - current_age.to_i
  target_year = CURRENT_YEAR + years_remaining

  prompt("It's currently #{CURRENT_YEAR}. You will retire in #{target_year}, " \
          "#{years_remaining} year(s) from now.")

  repeat = ''

  loop do
    prompt('Would you like to perform another calculation? [Y]/[N]')
    repeat = gets.chomp
    break if %w(y n).any? { |x| x.to_s.downcase == repeat[0] }
    prompt('Sorry, that answer is invalid.')
  end

  break if repeat[0].downcase == 'n'
end

prompt('Thanks for using the retirement age calculator!')

# P: Prompt the user for their current age and the age at which they would like
#    to retire. The program should display current_age, target_age,
#    current_year, target_year, and the total years of work remaining
#    (target - current).

# E:
#   both current_age and target age should be positive
#   target_age should be > current_age
#   Does grammar matter for "x year(s) remaining" where x = 1?

# D:
#   in:
#     current_age: int
#     target_age: int
#   out:
#     target_year: int
#     years_remaining: int

# A:
#   Prompt user for their current age (current_age)
#   Prompt user for their target retirement age (target_age)
#   Set years_remaining to (target_age - current_age)
#   Set target_year to (current_year + years_remaining)
#   Return interpolated string with target_year and years_remaining
