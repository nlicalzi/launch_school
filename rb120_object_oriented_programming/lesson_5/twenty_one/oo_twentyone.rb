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
    values = hand.map { |card| card[0] }    # map our hand to card vals
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
    @cards = VALUES.product(SUITS).shuffle
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

  def clear
    system 'clear'
  end

  def deal_cards
    2.times do |_|
      player.hit(deck)
      dealer.hit(deck)
    end
  end

  def display_initial_cards
    puts "#{player.name} is holding: #{player.hand.map(&:join)} (#{player.total} pts)"
    puts "#{dealer.name} is showing: #{dealer.hand[0].join}"
  end

  def display_hands
    puts "Player hand: #{player.hand.map(&:join)}"
    puts "Dealer hand: #{dealer.hand.map(&:join)}"
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
        clear
        display_initial_cards
        puts "Would you like to (h)it or (s)tay?"
        answer = gets.chomp.downcase
        player.hit(deck) if answer[0] == 'h'
        player.stay if answer[0] == 's'
        break if %w(h s).include?(answer[0])
        puts "Sorry, invalid answer..."
      end
      break if answer[0] == 's' # break out of all loops if staying
      break if player.busted?   # break out of loops if busted
    end
  end

  def dealer_turn
    loop do
      break if dealer.total >= 17
      dealer.hit(deck)
    end
  end

  def show_result
    clear
    if dealer.busted?
      puts "Dealer busted with #{dealer.total} pts! You win!"
      display_hands
    elsif player.busted?
      puts "You busted with #{player.total} pts! Dealer wins!"
      display_hands
    elsif dealer.total > player.total
      puts "Dealer wins with #{dealer.total} pts vs. your #{player.total} pts"
      display_hands
    else
      puts "You win with #{player.total} pts vs. dealer's #{dealer.total} pts"
      display_hands
    end
  end

  def start
    deal_cards
    display_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
