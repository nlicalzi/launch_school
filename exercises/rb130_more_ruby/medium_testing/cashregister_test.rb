require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < MiniTest::Test
  # def setup; end

  def test_accept_money
    register = CashRegister.new(0)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    assert_equal(register.total_money, 0)

    register.accept_money(transaction)
    assert_equal(register.total_money, 20)
  end
end