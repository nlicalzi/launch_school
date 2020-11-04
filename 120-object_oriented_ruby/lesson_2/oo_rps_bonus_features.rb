# Source: https://launchschool.com/lessons/dfff5f6b/assignments/acbfaeda

class Move
  VALUES = %w(rock paper scissors lizard spock)

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock?       && (other_move.scissors? || other_move.lizard?)) ||
      (paper?    && (other_move.rock?     || other_move.spock?))  ||
      (scissors? && (other_move.rock?     || other_move.lizard?)) ||
      (lizard?   && (other_move.paper?    || other_move.spock?))  ||
      (spock?    && (other_move.scissors? || other_move.rock?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts ""
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil # initialize choice var
    loop do
      puts ""
      puts "Please choose one of the following options: #{Move::VALUES}"
      choice = gets.chomp.downcase # reassign choice var
      break if Move::VALUES.include?(choice)
      puts "Sorry, that's an invalid choice."
    end
    self.move = Move.new(choice) # return a Move obj. from the getter method
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny Number5).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample) # sample VALUES from Move class
  end
end

# Game Orchestration Engine
class RPSGame
  WIN_SCORE = 10 # count of rounds required to win the whole match

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts ""
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts ""
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_scores
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  def print_scoreboard
    puts ""
    puts "Current scoreline is:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score} \n"
    puts ""
  end

  def display_match_winner
    if human.score == WIN_SCORE
      puts "#{human.name} wins with #{WIN_SCORE} points!"
    elsif computer.score == WIN_SCORE
      puts "#{computer.name} wins with #{WIN_SCORE} points!"
    end
  end

  def match_winner?
    true if human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def play_again?
    answer = nil
    puts 'Would you like to play again? (y/n)'
    loop do
      answer = gets.chomp[0].downcase
      break if %w(y n).include?(answer)
      puts 'Sorry, invalid answer. Please choose yes or no.'
    end
    return true if answer == 'y'
    false
  end

  def play # procedural / imperative code
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      update_scores
      print_scoreboard
      break if match_winner?
      break unless play_again?
    end
    puts display_match_winner if match_winner?
    display_goodbye_message
  end
end

RPSGame.new.play # play our game!
