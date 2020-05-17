require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  # def setup; end

  def test_prompt_for_payment
    transaction = Transaction.new(20)
    input = StringIO.new('20\n')
    transaction.prompt_for_payment(input: input)
    assert_equal(20, transaction.amount_paid)
  end
end