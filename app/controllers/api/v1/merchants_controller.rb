require 'pry'
class Api::V1::MerchantsController < ApplicationController

  # before_action :authenticate

  def random
    # respond_with Merchant.new.random
    respond_with Merchant.all.sample
  end

  def search
    # binding.pry
  respond_with Merchant.find_by(params.first.first => params.first.last)
  end

  def find_all
  respond_with Merchant.where(params.first.first => params.first.last)
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  private

  def merchant_params
    params.require(:item).permit(:name, :created_at, :updated_at)
  end

  # def authenticate
  #   authenticate_or_request_with_http_basic('Please authenticate in order to use this API') do |email,password|
  #     user = User.find_by(email: email)
  #     return true if user && user.authenticate(password)
  #
  #     head :unauthorized
  #   end
  # end
end
