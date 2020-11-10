# Source: https://launchschool.com/exercises/a1938086

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
    VALUES[rank] <=> VALUES[other.rank]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

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

class PokerHand
  attr_accessor :cards

  def initialize(deck)
    @cards = []
    5.times { cards << deck.draw }
  end

  def print
    puts cards.map(&:to_s)
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def card_values
    cards.map { |card| Card::VALUES[card.rank] }
  end

  def max_occurring_card_count
    card_values.uniq.map { |n| card_values.count(n) }.max
  end

  private

  def royal_flush?
    flush? && straight? && card_values.max == 14
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    max_occurring_card_count == 4
  end

  def full_house?
    card_values.map { |i| card_values.count(i) }.uniq.sort == [2, 3]
  end

  def flush?
    cards.map(&:suit).uniq.size == 1
  end

  def straight?
    card_values.sort.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def three_of_a_kind?
    max_occurring_card_count == 3
  end

  def two_pair?
    card_values.map { |n| card_values.count(n) }.count(2) == 4
  end

  def pair?
    max_occurring_card_count == 2
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
                       Card.new(10,      'Hearts'),
                       Card.new('Ace',   'Hearts'),
                       Card.new('Queen', 'Hearts'),
                       Card.new('King',  'Hearts'),
                       Card.new('Jack',  'Hearts')
                     ])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
                       Card.new(8,       'Clubs'),
                       Card.new(9,       'Clubs'),
                       Card.new('Queen', 'Clubs'),
                       Card.new(10,      'Clubs'),
                       Card.new('Jack',  'Clubs')
                     ])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
                       Card.new(3, 'Hearts'),
                       Card.new(3, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(3, 'Spades'),
                       Card.new(3, 'Diamonds')
                     ])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
                       Card.new(3, 'Hearts'),
                       Card.new(3, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(3, 'Spades'),
                       Card.new(5, 'Hearts')
                     ])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
                       Card.new(10,     'Hearts'),
                       Card.new('Ace',  'Hearts'),
                       Card.new(2,      'Hearts'),
                       Card.new('King', 'Hearts'),
                       Card.new(3,      'Hearts')
                     ])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
                       Card.new(8,      'Clubs'),
                       Card.new(9,      'Diamonds'),
                       Card.new(10,     'Clubs'),
                       Card.new(7,      'Hearts'),
                       Card.new('Jack', 'Clubs')
                     ])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
                       Card.new('Queen', 'Clubs'),
                       Card.new('King',  'Diamonds'),
                       Card.new(10,      'Clubs'),
                       Card.new('Ace',   'Hearts'),
                       Card.new('Jack',  'Clubs')
                     ])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
                       Card.new(3, 'Hearts'),
                       Card.new(3, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(3, 'Spades'),
                       Card.new(6, 'Diamonds')
                     ])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
                       Card.new(9, 'Hearts'),
                       Card.new(9, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(8, 'Spades'),
                       Card.new(5, 'Hearts')
                     ])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
                       Card.new(2, 'Hearts'),
                       Card.new(9, 'Clubs'),
                       Card.new(5, 'Diamonds'),
                       Card.new(9, 'Spades'),
                       Card.new(3, 'Diamonds')
                     ])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
                       Card.new(2,      'Hearts'),
                       Card.new('King', 'Clubs'),
                       Card.new(5,      'Diamonds'),
                       Card.new(9,      'Spades'),
                       Card.new(3,      'Diamonds')
                     ])
puts hand.evaluate == 'High card'