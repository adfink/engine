require 'pry'


class Api::V1::MerchantsController < ApplicationController
  # respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def create
    respond_with Merchant.create(merchant_params)
  end

  def update
    respond_with Merchant.update(params[:id], merchant_params)
  end

  def destroy
    respond_with Merchant.destroy(params[:id])
  end

  def random
    respond_with Merchant.all.sample
  end

  def search
    respond_with Merchant.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Merchant.where(params.first.first => params.first.last)
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity].to_i)
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

  # def revenue_by_date
  #   respond_with Merchant.total_revenue_by_date(params[:date])
  # end

  def revenue_by_date
    respond_with Merchant.revenue_by_date(params[:date])
  end

  def revenue
    if params[:date]
      # binding.pry
      respond_with Merchant.find_by(id: params[:id]).revenue_by_date_for_one_merchant(params[:date])
    else
      respond_with Merchant.find_by(id: params[:id]).total_revenue
    end
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end

  def customers_with_pending_invoices
    respond_with Merchant.find_by(id: params[:id]).customers_with_pending_invoices
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end

end

