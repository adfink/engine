require File.expand_path("../../test_helper", __FILE__)


class InvoiceItemTest < ActiveSupport::TestCase
  test "can create an Invoice Item" do
    ii = InvoiceItem.new(item_id: 3, invoice_id: 23, unit_price: 27, quantity: 6)
    assert ii.save
  end

  test "Invoice Item is invalid without item, invoice, price, or quantity" do
    ii = InvoiceItem.new
    assert_not ii.save
  end

  test "Invoice Item is invalid without item_id" do
    ii = InvoiceItem.new(invoice_id: 22, unit_price: 4, quantity: 10)
    assert_not ii.save
  end

  test "Invoice Item is invalid without invoice_id" do
    ii = InvoiceItem.new(item_id: 10, unit_price: 4, quantity: 10)
    assert_not ii.save
  end

  test "Invoice Item is invalid without price" do
    ii = InvoiceItem.new(item_id: 40, invoice_id: 8, quantity: 45)
    assert_not ii.save
  end

  test "Invoice Item is invalid without quantity" do
    ii = InvoiceItem.new(item_id: 14, invoice_id: 2, unit_price: 8)
    assert_not ii.save
  end
end
