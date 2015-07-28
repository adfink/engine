class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices


  # def random
  #   Merchant.order("RANDOM()").first
  # end

  def self.most_revenue(quantity)

    # binding.pry
    Merchant.all.sort_by {|merchant| merchant.revenue }.reverse.first(quantity.to_i)

  end

  def self.most_items(quantity)
    Merchant.all.sort_by { |merchant| merchant.items_sold }.reverse.first(quantity.to_i)
  end

  def items_sold
    self.invoices.map(&:total_items).reduce(:+)
  end

  def revenue
    self.invoices.map(&:total_revenue).reduce(:+)
  end



end
