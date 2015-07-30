require File.expand_path("../../test_helper", __FILE__)


class InvoiceTest < ActiveSupport::TestCase
  test "can create an Invoice" do
    invoice = Invoice.new(merchant_id: 1, customer_id: 22, status: "completed")
    assert invoice.save
  end

  test "invoice is invalid without merchant. customer, or status" do
    invoice = Invoice.new
    assert_not invoice.save
  end

  test "invoice is invalid without merchant" do
    invoice = Invoice.new(customer_id: 22, status: "completed")
    assert_not invoice.save
  end

  test "invoice is invalid without customer" do
    invoice = Invoice.new(merchant_id: 4, status: "completed")
    assert_not invoice.save
  end

  test "invoice is invalid without status" do
    invoice = Invoice.new(merchant_id: 6, customer_id: 55)
    assert_not invoice.save
  end
end
