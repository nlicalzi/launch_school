# Source: https://launchschool.com/lessons/a0f3cd44/assignments/4f8be124

VALID_CHOICES = %w(rock paper scissors lizard spock)
CHOICES_ABBREV = %w(r p sc l sp)
CHOICE_HASH = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
                'l' => 'lizard', 'sp' => 'spock' }
HIERARCHY = { 'rock' => ['scissors', 'lizard'],
              'paper' => ['rock', 'spock'],
              'scissors' => ['paper', 'lizard'],
              'lizard' => ['paper', 'spock'],
              'spock' => ['rock', 'scissors'] }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  HIERARCHY[first].any? { |x| x == second }
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

def result(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'draw'
  end
end

score = { 'player' => 0, 'computer' => 0, 'draw' => 0 }

loop do
  choice = ''
  loop do
    prompt("Choose one: [r]ock, [p]aper, [sc]issors, [l]izard, [sp]ock")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    elsif CHOICES_ABBREV.include?(choice)
      choice = CHOICE_HASH[choice]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}, computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  round_winner = result(choice, computer_choice)

  score[round_winner] += 1

  prompt("...Player score is #{score['player']}")
  prompt("...Computer score is #{score['computer']}")

  if score.values.any? { |x| x == 5 }
    prompt("We have a grand winner!")
    prompt("Congratulations to our winner: *#{round_winner}*!!")

    break
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
