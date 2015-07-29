require 'pry'
class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  validates :merchant_id, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true

  def total_revenue
    self.invoice_items.map(&:total_cost).map(&:to_i).reduce(:+)
  end

  def total_items
    self.invoice_items.map(&:quantity).map(&:to_i).reduce(:+)
  end

  def self.successful
    joins(:transactions).where(:transactions => {result:"success"})
  end

  def self.unsuccessful
    # binding.pry
    all - successful
  end

  def self.favorite_customer
    joins(:customer).group(:customer_id).count.sort_by { |id, count| count }.reverse.first[0]
  end

  def self.favorite_merchant
    # binding.pry
    merchants = joins(:merchant).group(:merchant_id).count.sort_by { |id, count| count }.reverse
      if merchants.first
       Merchant.find(merchants.first[0])
      else
        "sorry no merchants"
      end
  end
  # Invoice.first.invoice_items.map {|i| i.total_cost}.map{|i|i.to_i}.reduce(:+)


  # Merchant.first.invoices.map { |i| i.invoice_items.total_cost }

end



