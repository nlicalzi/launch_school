FIRST_MOVE = 'choose' # OPTIONS: "player" / "computer" / "choose"
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim=', ', conjunction = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr[0]
  when 2 then arr.join(" #{conjunction} ")
  else
    arr[-1] = "#{conjunction} #{arr[-1]}"
    arr.join(delim)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(hsh)
  system 'clear'
  puts ""
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts "     |     |     "
  puts "  #{hsh[1]}  |  #{hsh[2]}  |  #{hsh[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{hsh[4]}  |  #{hsh[5]}  |  #{hsh[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{hsh[7]}  |  #{hsh[8]}  |  #{hsh[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_move!(brd)
  square = ''
  loop do
    prompt "Please select a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    p "Sorry, that's an invalid input. Try again below."
  end

  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  square = nil

  # attack
  WINNING_LINES.each do |line|
    square = detect_threatened_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defend
  if !square
    WINNING_LINES.each do |line|
      square = detect_threatened_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    if empty_squares(brd).include?(5)
      square = 5
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def match_over?(player_pts, computer_pts)
  !!match_winner(player_pts, computer_pts)
end

def match_winner(player_pts, computer_pts)
  return 'Computer wins the match with 5 points!' if computer_pts == 5
  return 'Player wins the match with 5 points!' if player_pts == 5
  nil
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def detect_threatened_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def place_piece!(board, current_player)
  player_move!(board) if current_player == "player"
  computer_move!(board) if current_player == "computer"
end

def alternate_player(player)
  return "computer" if player == "player"
  "player"
end

player_score = 0
computer_score = 0
current_player = ''

loop do
  if FIRST_MOVE == 'choose'
    prompt "Who should go first? Please type (player) or (computer)?"
    current_player = gets.chomp.downcase
  else
    current_player = FIRST_MOVE
  end
  break if current_player == 'player' || current_player == 'computer'
  p "Sorry, that's an invalid input. Try again below."
end

loop do
  board = initialize_board
  display_board(board)

  loop do
    display_board(board)
    puts "Player score: #{player_score}. Computer score: #{computer_score}."

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)

    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
    if detect_winner(board) == 'Player'
      player_score += 1
    else
      computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  break if match_over?(player_score, computer_score)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt match_winner(player_score, computer_score)
prompt "Final score is..."
prompt "Player: #{player_score} || Computer: #{computer_score}"
prompt "Thanks for playing TicTacToe! Goodbye."
