require File.expand_path("../../test_helper", __FILE__)

class TransactionTest < ActiveSupport::TestCase
  test "can create a Transaction" do
    transaction = Transaction.new(invoice_id: 2, credit_card_number:"1234567890")
    assert transaction.save
  end

  test "transaction is invalid without invoice_id or cc number" do
    transaction = Transaction.new
    assert_not transaction.save
  end

  test "transaction is invalid without invoice_id" do
    transaction = Transaction.new(credit_card_number: "1234567890")
    assert_not transaction.save
  end

  test "transaction is invalid without cc number" do
    transaction = Transaction.new(invoice_id: 2)
    assert_not transaction.save
  end
end
