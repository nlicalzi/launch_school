# Source: https://launchschool.com/lessons/a0f3cd44/assignments/9e75343c
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'scissors' && computer == 'paper') ||
     (player == 'paper' && computer == 'rock')
    prompt("You win!")
  elsif player == computer
    prompt("It's a draw!")
  else
    prompt("You lose!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: rock, paper, scissors")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}, computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
