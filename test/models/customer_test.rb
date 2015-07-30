require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "can create a Customer" do
    customer = Customer.new(first_name: "Drew", last_name: "Fink")
    assert customer.save
  end

  test "customer is invalid without first name" do
    customer = Customer.new(last_name: "Fink")
    assert_not customer.save
  end

  test "customer is invalid without last name" do
    customer = Customer.new(first_name: "Drew")
    assert_not customer.save
  end
end
