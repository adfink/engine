class Api::V1::CustomersController < ApplicationController
  def random
    respond_with Customer.all.sample
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def search
    respond_with Customer.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Customer.where(params.first.first => params.first.last)
  end

  def transactions
    respond_with Customer.find_by(id: params[:customer_id]).invoices.flat_map { |invoice| invoice.transactions }
  end

  def favorite_merchant
    respond_with Customer.find_by(id: params[:id]).invoices.favorite_merchant
  end

end
