# Source: https://launchschool.com/lessons/de05b300/assignments/b6baf7e6

CARDS = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
SUITS = %w(hearts diamonds clubs spades)
SUITS_UNICODE = %w(♥ ♦ ♣ ♠)
CARD_VALUE = { '2' => 2, '3' => 3, '4' => 4, '5' => 5,
               '6' => 6, '7' => 7, '8' => 8, '9' => 9,
               '10' => 10, 'jack' => 10, 'queen' => 10,
               'king' => 10, 'ace' => 'ace' }

def prompt(msg)
  puts "=> #{msg}"
end

def summed_hand_value(hand)
  hand.map { |card| CARD_VALUE[card[0]] }.sum
end

def hand_has_ace?(hand)
  hand.flatten.include?('ace')
end

def calculate_hand_value(hand)
  return summed_hand_value(hand) unless hand_has_ace?(hand)

  aceless_hand = hand.reject { |card| card[0] == 'ace' }
  aceless_hand_value = summed_hand_value(aceless_hand)

  aces = hand - aceless_hand_value
end

deck = CARDS.product(SUITS_UNICODE) # An array w/ sub arrays: ['card', 'suit']

dealer_hand = []
dealer_hand_value = 0

player_hand = []
player_hand_value = 0

system 'clear'
prompt "Welcome to Twenty One! You'll be playing against the dealer."
prompt "First, you'll each be dealt two cards."
puts ""

2.times do # deal 2 cards to the player and 2 to the dealer
  player_hand << deck.shuffle!.pop # randomize/remove card from deck & append
  dealer_hand << deck.shuffle!.pop # randomize/remove card from deck & append
end

prompt "Player hand: #{player_hand}"
prompt "Dealer card: #{dealer_hand[0]}"

player_hand_value = player_hand.map { |card| CARD_VALUE[card[0]] }.sum
dealer_show_value = CARD_VALUE[dealer_hand[0][0]]

prompt "You are holding #{player_hand_value} points. "\
       "Dealer is showing #{dealer_show_value} points."

prompt "Would you like to hit or pass?"
