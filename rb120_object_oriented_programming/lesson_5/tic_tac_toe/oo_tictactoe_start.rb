# Source: https://launchschool.com/lessons/97babc46/assignments/7dcb53f1

# OOP Tic Tac Toe Description

# Tic-tac-toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

# Nouns: boad, player, square, grid
# Verbs: play, mark

# Board
# Square
# Player
#   - Mark
#   - Play

## Spike Section
class Board
  def initialize
    # how can we model the 3x3 grid? maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a "status" to keep track of this square's mark?
  end
end

class Player
  def initialize
    # maybe a marker to keep track of symbol? (i.e. 'X' or 'O'?)
  end

  def mark
  end
end

class TTTGame
  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

# new game starts like this:
game = TTTGame.new
game.play
