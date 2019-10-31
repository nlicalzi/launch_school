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
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
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

player_score = 0
computer_score = 0

loop do
  board = initialize_board
  display_board(board)

  loop do
    display_board(board)
    puts "Player score: #{player_score}. Computer score: #{computer_score}."

    player_move!(board)
    break if someone_won?(board) || board_full?(board)

    computer_move!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_score += 1
    else
      computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing TicTacToe! Goodbye."
