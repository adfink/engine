class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items


  def total_revenue
    self.invoice_items.map(&:total_cost).map(&:to_i).reduce(:+)
  end

  # Invoice.first.invoice_items.map {|i| i.total_cost}.map{|i|i.to_i}.reduce(:+)


  # Merchant.first.invoices.map { |i| i.invoice_items.total_cost }

end
