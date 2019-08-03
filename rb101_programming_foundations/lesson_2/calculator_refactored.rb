# Source: https://launchschool.com/lessons/a0f3cd44/assignments/fcd8a299

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  !num.to_i.zero?
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''

loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = 0
  number2 = 0

  loop do
    prompt("What's the first number?")
    number1 = gets.chomp.to_i

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  loop do
    prompt("What's the second number?")
    number2 = gets.chomp.to_i

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
  What operation do you want to perform?
    1) +
    2) -
    3) *
    4) /
  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please select a valid operator. 1) + 2) - 3) * 4) /")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}.")

  prompt("Do you want to perform another calculation? Y to calculate again")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # exit main loop

prompt("Thanks for 'playing'! See you later!")
