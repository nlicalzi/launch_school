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

    assert_equal(0, register.total_money)

    register.accept_money(transaction)
    assert_equal(20, register.total_money)
  end

  def test_change
    register = CashRegister.new(0)
    transaction = Transaction.new(20)

    transaction.amount_paid = 20
    assert_equal(0, register.change(transaction))

    transaction.amount_paid = 30
    assert_equal(10, register.change(transaction))
  end
end