# https://launchschool.com/lessons/a0f3cd44/assignments/4f8be124
VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: [r]ock, [p]aper, [sc]issors, [l]izard, [sp]ock")
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
