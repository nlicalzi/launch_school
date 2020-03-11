# Source: https://launchschool.com/lessons/97babc46/assignments/819bf113
require 'pry'
class Player
  attr_accessor :hand, :name

  def initialize(name)
    @hand = []
    @name = name
  end

  def hit(deck)
    hand << deck.deal_card!
  end

  def stay; end

  def busted?
    total > 21
  end

  def total
    values = hand.map { |card| card[1] }    # map our hand to card vals
    values.map do |val|
      val = 10 if %w(J Q K A).include?(val) # convert face cards
      val.to_i                              # otherwise convert to int form
    end.sum                                 # return sum of values
  end
end

class Deck
  SUITS = %w(♠ ♥ ♦ ♣)
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  attr_accessor :cards

  def initialize
    @cards = SUITS.product(VALUES).shuffle
  end

  def deal_card!
    cards.shift
  end
end

class Game
  PLAYER_NAME = 'Nick'
  DEALER_NAME = 'Dealer'

  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new(PLAYER_NAME)
    @dealer = Player.new(DEALER_NAME)
    @deck = Deck.new
  end

  def deal_cards
    2.times do |_|
      player.hit(deck)
      dealer.hit(deck)
    end
  end

  def show_initial_cards
    puts "#{player.name} is holding: #{player.hand} (or #{player.total} pts)"
    puts "#{dealer.name} is holding: [#{dealer.hand[0]}, [?, ?]]"
  end

  # player turn:
  # loop
  #   player chooses hit or stay
  #   repeat unless busted || player.stay?
  # end
  # if busted: puts "you lose with #{player.total} points!"

  def player_turn
    answer = nil
    loop do
      loop do
        puts "Would you like to (h)it or (s)tay?"
        answer = gets.chomp.downcase
        player.hit(deck) if answer[0] == 'h'
        player.stay if answer[0] == 's'
        break if %w(h s).include?(answer[0])
        puts "Sorry, invalid answer..."
      end
      break if answer[0] == 's' # break out of all loops if staying
      break if player.busted?
    end
  end

  def dealer_turn
    dealer.hit unless dealer.total >= 17
  end

  def show_result; end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
