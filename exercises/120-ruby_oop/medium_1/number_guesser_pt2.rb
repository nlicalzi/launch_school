# Source: https://launchschool.com/exercises/e50996f7

class GuessingGame
  attr_reader :guess, :min, :max

  def initialize(min, max)
    @min = min
    @max = max
    @tries = Math.log2(max - min + 1).to_i + 1
    @guess = nil
  end

  def print_tries
    puts "You have #{@tries} guesses remaining."
  end

  def prompt
    print "Enter a number between #{min} and #{max}: "
    @guess = gets.chomp
  end

  def integer?(val)
    val == val.to_i.to_s
  end

  def in_bounds?(val)
    (min..max).cover?(val.to_i)
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
    winning_num = rand(min..max)
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

game = GuessingGame.new(501, 1500)
game.play

