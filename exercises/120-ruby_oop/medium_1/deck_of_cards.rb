# Source: https://launchschool.com/exercises/9bb05e87

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }.freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    VALUES[self.rank] <=> VALUES[other.rank]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spaces).freeze

  attr_accessor :cards

  def initialize
    @cards = RANKS.product(SUITS).map { |pair| Card.new(pair[0], pair[1]) }
    @cards.shuffle! 
  end

  def draw
    initialize if cards.empty?
    cards.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
