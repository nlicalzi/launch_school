# Source: https://launchschool.com/lessons/de05b300/assignments/b6baf7e6

CARDS = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
SUITS = %w(hearts diamonds clubs spades)
SUITS_UNICODE = %w(♥ ♦ ♣ ♠)
CARD_VALUE = { '2' => 2, '3' => 3, '4' => 4, '5' => 5,
               '6' => 6, '7' => 7, '8' => 8, '9' => 9,
               '10' => 10, 'jack' => 10, 'queen' => 10,
               'king' => 10, 'ace' => 'ace' }

# GAMEPLAY METHODS

def deal_card(hand, deck)
  hand << deck.shuffle!.pop
end

# BOOLEAN METHODS
def hand_has_ace?(hand)
  hand.flatten.include?('ace')
end

def valid_player_choice?(input)
  input.downcase == "hit" || input.downcase == "stay"
end

def busted?(hand)
  calculate_hand_value(hand) > 21
end

# CALCULATION METHODS
def summed_hand_value(hand)
  hand.map { |card| CARD_VALUE[card[0]] }.sum
end

def calculate_aces_value(aceless_hand, aces)
  val = 0
  aces.size.times do
    (summed_hand_value(aceless_hand) + val + 11) < 22 ? (val += 11) : (val += 1)
  end
  val
end

def calculate_hand_value(hand)
  return summed_hand_value(hand) unless hand_has_ace?(hand)

  aceless_hand = hand.reject { |card| card[0] == 'ace' }
  aces = hand - aceless_hand
  summed_hand_value(aceless_hand) + calculate_aces_value(aceless_hand, aces)
end

# DISPLAY METHODS
def prompt(msg)
  puts "=> #{msg}"
end

def display_hands(player_hand, dealer_hand)
  puts "Player hand: #{player_hand}"
  puts "Dealer hand: #{dealer_hand[0]} & #{dealer_hand.size - 1} hidden."
end

def display_final_game_state(player_hand, dealer_hand)
  system 'clear'
  puts "Player hand: #{player_hand}"
  puts "Player points: #{calculate_hand_value(player_hand)}"
  puts ""
  puts "Dealer hand: #{dealer_hand}"
  puts "Dealer points: #{calculate_hand_value(dealer_hand)}"
end

def display_results(player_hand, dealer_hand)
  system 'clear'
  player_points = calculate_hand_value(player_hand)
  dealer_points = calculate_hand_value(dealer_hand)

  puts "Our final scores are as follows:"
  puts "Player: #{player_points} || Dealer: #{dealer_points}"
end

def winner(player_hand, dealer_hand)
  player_pts = calculate_hand_value(player_hand)
  dealer_pts = calculate_hand_value(dealer_hand)
  (player_pts > dealer_pts) || busted?(dealer_hand) ? ("Player") : ("Dealer")
end

player_wins = 0
dealer_wins = 0

loop do
  deck = CARDS.product(SUITS_UNICODE) # An array w/ sub arrays: ['card', 'suit']

  dealer_hand = [] # initialize our dealer's hand array
  player_hand = [] # initialize our player's hand array

  system 'clear'
  puts "Welcome to Twenty One! You'll be playing against the dealer."
  puts "First, you'll each be dealt two cards."
  puts ""

  2.times do # deal 2 cards to the player and 2 to the dealer
    deal_card(player_hand, deck)
    deal_card(dealer_hand, deck)
  end

  answer = nil
  loop do # player turn logic
    display_hands(player_hand, dealer_hand)
    puts ""
    prompt "You are holding #{calculate_hand_value(player_hand)} points. "\
           "Would you like to hit or stay?"

    loop do
      answer = gets.chomp
      break if valid_player_choice?(answer)
      prompt "Sorry, invalid input. Please choose either (hit) or (stay)"
    end

    deal_card(player_hand, deck) if answer == "hit"
    break if busted?(player_hand)
    break if answer == "stay"
    system 'clear' # clear screen for the next round
  end

  if busted?(player_hand) # end game if player busted
    system 'clear'
    display_final_game_state(player_hand, dealer_hand)
    puts ""
    puts "Game over! Player busted, Dealer wins!"
  else # dealer turn logic
    system 'clear'
    display_hands(player_hand, dealer_hand)

    loop do
      break if calculate_hand_value(dealer_hand) > 17 # don't let dealer bust
      deal_card(dealer_hand, deck)
      break if busted?(dealer_hand)
    end

    display_final_game_state(player_hand, dealer_hand)
    puts ""
    puts "Game over! #{winner(player_hand, dealer_hand)} wins!"
  end

  if !busted?(player_hand) && winner(player_hand, dealer_hand) == "Player"
    player_wins += 1
  elsif calculate_hand_value(player_hand) == calculate_hand_value(dealer_hand)
    puts "It was a draw!"
  else
    dealer_wins += 1
  end

  puts ""
  puts "Current scoreline is Player: #{player_wins} || Dealer: #{dealer_wins}"
  puts ""
  prompt "Would you like to play again? Enter (y) to continue..."
  answer = gets.chomp
  break unless answer.downcase.chr == "y"
end
