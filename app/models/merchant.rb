class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  validates :name, presence: true

  def self.most_revenue(quantity)
    all.sort_by{ |merchant| merchant.total_revenue }.last(quantity).reverse
    # Merchant.all.sort_by {|merchant| merchant.revenue }.reverse.first(quantity.to_i)
  end

  def total_revenue
    successful.joins(:invoice_items).sum("quantity * unit_price")
  end


  # def revenue
  #   self.invoices.map(&:total_revenue).reduce(:+)
  # end


  def self.most_items(quantity)
    all.sort_by { |merchant| merchant.total_items }.last(quantity).reverse
    # Merchant.all.sort_by { |merchant| merchant.items_sold }.reverse.first(quantity.to_i)
  end

  def total_items
    successful.joins(:invoice_items).sum(:quantity)
  end


  # def items_sold
  #   self.invoices.map(&:total_items).reduce(:+)
  # end

  # def self.revenue_by_date(date)
  #   all.map
  # end


  def revenue_by_date_for_one_merchant(date)
    # binding.pry
    # parsed_date = Date.parse(date)
    successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.revenue_by_date(date)
    all.inject(0) { |sum, merchant| sum + merchant.revenue_by_date_for_one_merchant(date) }
  end

  def favorite_customer
    Customer.find(successful.favorite_customer)
  end

  def customers_with_pending_invoices
    failed.map { |invoice| invoice.customer}
  end

  def successful
    invoices.successful
  end
  private


  def failed
    invoices.unsuccessful
  end

end





