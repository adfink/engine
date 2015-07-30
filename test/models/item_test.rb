require 'test_helper'
require File.expand_path("../../test_helper", __FILE__)

class ItemTest < ActiveSupport::TestCase
  test "can create an Item" do
    item = Item.new(name: "Ice Cream", description: "mmmm", unit_price: 50, merchant_id: 1)
    assert item.save
  end

  test "item is invalid without name, description, price, or merchant" do
    item = Item.new
    assert_not item.save
  end

  test "item is invalid without name" do
    item = Item.new(description: "mmmmm", unit_price: 50, merchant_id: 1)
    assert_not item.save
  end

  test "item is invalid without description" do
    item = Item.new(name: "Ice Cream", unit_price: 50, merchant_id: 1)
    assert_not item.save
  end

  test "item is invalid without price" do
    item = Item.new(name: "Ice Cream", description: "mmmmmm", merchant_id: 1)
    assert_not item.save
  end

  test "item is invalid without merchant_id" do
    item = Item.new(name: "Ice Cream", description: "mmmm", unit_price: 50)
    assert_not item.save
  end
end
