# Source: https://launchschool.com/exercises/e4b17f84

class GuessingGame
  MIN_BOUND = 1
  MAX_BOUND = 100

  attr_reader :guess

  def initialize
    @tries = 7 # decrement by 1 each time until 0 left
    @guess = nil
  end

  def print_tries
    puts "You have #{@tries} guesses remaining."
  end

  def prompt
    print "Enter a number between #{MIN_BOUND} and #{MAX_BOUND}: "
    @guess = gets.chomp
  end

  def integer?(val)
    val == val.to_i.to_s
  end

  def in_bounds?(val)
    (0..100).cover?(val.to_i)
  end

  def winning_guess?(target)
    guess.to_i == target
  end

  def judge_guess(target)
    if guess.to_i == target
      puts "That's the number!"
    elsif guess.to_i > target
      puts 'Your guess is too high.'
    else
      puts 'Your guess is too low.'
    end
    puts ''
  end

  def ending_message(target)
    winning_guess?(target) ? 'You won!' : 'You have no more guesses. You lost!'
  end

  def play
    winning_num = rand(0..100)
    loop do
      print_tries
      loop do
        prompt
        break if integer?(guess) && in_bounds?(guess)
        puts 'Invalid guess.'
      end
      judge_guess(winning_num)
      @tries -= 1
      break if @tries.zero? || winning_guess?(winning_num)
    end
    puts ending_message(winning_num)
  end
end

game = GuessingGame.new
game.play
