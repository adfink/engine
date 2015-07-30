# require 'test_helper'
require File.expand_path("../../test_helper", __FILE__)


class MerchantTest < ActiveSupport::TestCase
  test "can create a Merchant" do
    merchant = Merchant.new(name:"The Goods")
    assert merchant.save
  end

  test "merchant is invalid without name" do
    merchant = Merchant.new
    assert_not merchant.save
  end
end
