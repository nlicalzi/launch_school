# Source: https://launchschool.com/lessons/97babc46/assignments/cce6a20b
require 'pry'

module Editable
  def joinor(arr, delim=', ', conj='or')
    arr = arr.map(&:to_s)
    case arr.size
    when 0 # empty array
      return []
    when 1 # array with one element
      return arr[0]
    when 2 # array with two elements
      return "#{arr[0]} #{conj} #{arr[1]}"
    else # array with more than two elements
      return arr[0..-2].join(delim) + "#{delim + conj} " + arr[-1]
    end
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if winning_line?(squares)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def winning_line?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  attr_accessor :marker
  INITIAL_MARKER = ' '

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  include Editable

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  PLAYER_ONE = 'computer'
  WINNING_SCORE = 5

  attr_reader :board, :human, :computer, :current_player

  @@human_wins = 0
  @@computer_wins = 0

  def initialize
    @board = Board.new
    @current_player = PLAYER_ONE
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    clear
    display_welcome_message
    loop do
      display_board
      display_score
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break if match_winner
      break unless play_again?
      reset
      display_play_again_message
    end

    puts "#{match_winner} won with #{WINNING_SCORE} points!" if match_winner
    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    square = nil
    puts "Choose a square: (#{joinor(board.unmarked_keys)})"
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  # def computer_moves
  #   board[board.unmarked_keys.sample] = computer.marker
  # end

  # returns winning space or nil
  def winning_space(line, board)
    if board.values_at(*line).count(HUMAN_MARKER) == 2
      board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    else
      nil
    end
  end

  def computer_moves!(brd)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = winning_space(line, brd)
      break if square
    end

    if !square
      square = empty_squares(brd).sample
    end

    brd[square] = COMPUTER_MARKER
  end

  def current_player_moves
    case @current_player
    when 'human'
      human_moves
    when 'computer'
      computer_moves!(board)
    end
    change_player
  end

  def change_player
    case @current_player
    when 'human'
      @current_player = 'computer'
    when 'computer'
      @current_player = 'human'
    end
  end

  def display_score
    puts "Current score is:"
    puts "Human: #{@@human_wins}, Computer: #{@@computer_wins}"
  end

  def match_winner
    return 'Human' if @@human_wins == WINNING_SCORE
    return 'Computer' if @@computer_wins == WINNING_SCORE
    nil
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
      @@human_wins += 1
    when computer.marker
      puts "Computer won!"
      @@computer_wins += 1
    else
      puts 'The board is full!'
    end

    display_score
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase[0]
      break if %w(y n).include?(answer)
      puts "Sorry, must be [y]es or [n]o."
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_player = PLAYER_ONE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def human_turn?
    @current_player == 'human'
  end
end

game = TTTGame.new
game.play
