INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(hsh)
  puts ""
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
    prompt "Please select a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    p "Invalid input. Try again below."
  end

  brd[square] = PLAYER_MARKER
end

board = initialize_board
display_board(board)

player_move!(board)
display_board(board)
