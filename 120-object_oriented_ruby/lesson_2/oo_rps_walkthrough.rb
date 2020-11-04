# Source: https://launchschool.com/lessons/dfff5f6b/assignments/ecf92a8c

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil # initial move: nil
    @name = set_name
  end

  def set_name
    if human?
      n = ""
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, you must enter a value."
      end
      self.name = n
    else
      self.name = %w(R2D2 Hal Chappie Sonny Number5).sample
    end
  end

  def choose # humans get prompted, computer picks randomly
    if human?
      choice = nil # initialize choice var
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp # reassign choice var
        break if %w(rock paper scissors).include?(choice.downcase)
        puts "Sorry, that's an invalid choice."
      end
      self.move = choice.downcase # final reassign of validated choice
    else
      self.move = %w(rock paper scissors).sample
    end
  end

  def human?
    @player_type == :human
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end
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
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play # play our game!
