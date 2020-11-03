# Source: https://launchschool.com/lessons/dfff5f6b/assignments/ff0b0ded

class Move
  VALUES = %w(rock paper scissors)

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

  def >(other_move)
    case @value
    when 'rock'
      return true if other_move.scissors?
      return false
    when 'paper'
      return true if other_move.rock?
      return false
    when 'scissors'
      return true if other_move.paper?
      return false
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
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
      puts "Please choose rock, paper, or scissors:"
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
    self.move = Move.new(Move::VALUES.sample) # sample VALUES const from Move class
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
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

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
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
