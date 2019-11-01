# Source: https://launchschool.com/lessons/de05b300/assignments/b6baf7e6

CARDS = %w(two three four five six seven eight nine ten jack queen king ace)
SUITS = %w(hearts diamonds clubs spades)
CARD_VALUE = { 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
               'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9,
               'ten' => 10, 'jack' => 10, 'queen' => 10, 'king' => 10 }

def prompt(msg)
  puts "=> #{msg}"
end

deck = SUITS.product(CARDS)
dealer_hand = []
player_hand = []

prompt "Welcome to Twenty One! You'll be playing against the dealer."
prompt "First, you'll each be dealt two cards."

2.times do # deal 2 cards to the player and 2 to the dealer
  player_hand << deck.shuffle!.pop # randomize and remove a card
  dealer_hand << deck.shuffle!.pop # randomize and remove a card
end

p player_hand
# p dealer_hand[0]

player_hand.each do |card|
  p CARD_VALUE[card[1]]
end
