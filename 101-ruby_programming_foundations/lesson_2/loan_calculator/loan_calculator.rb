require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  (integer?(num) || float?(num)) && num.to_f > 0
end

loop do
  loan_amt = 0
  apr = 0
  duration = 0

  prompt(MESSAGES['greet'])
  prompt("...")

  loop do
    prompt(MESSAGES['get_loan'])

    loan_amt = gets.chomp

    if integer?(loan_amt)
      break
    else
      prompt(MESSAGES['loan_error'])
    end
  end

  loop do
    prompt(MESSAGES['get_apr'])
    apr = gets.chomp

    if valid_number?(apr)
      break
    else
      prompt(MESSAGES['apr_error'])
    end
  end

  loop do
    prompt(MESSAGES['get_duration'])
    duration = gets.chomp

    if integer?(duration)
      apr = apr.to_f / 100
      break
    else
      prompt(MESSAGES['duration_error'])
    end
  end

  monthly_rate = apr / 12.0
  prompt("Entry summary...")
  prompt("----------------")
  prompt("Loan Amount: $#{loan_amt}")
  prompt("Loan Duration: #{duration} months")
  prompt("APR: #{apr*100}%")
  prompt("Monthly Rate: #{monthly_rate*100}%")
  prompt("----------------")

  monthly = loan_amt.to_f * (monthly_rate.to_f /
            (1 - (1 + monthly_rate.to_f)**(-duration.to_i)))
  prompt("Okay, your monthly payment is $#{format('%02.2f', monthly)}!")

  prompt(MESSAGES['repeat_loop'])
  repeat = gets.chomp

  break unless repeat.downcase().start_with?('y')
end

prompt("Hope this calculator was helpful!")
prompt("See ya later~")
