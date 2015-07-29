class Item < ActiveRecord::Base
  # default_scope { where(:updated_at => ) }
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    all.sort_by { |item| item.total_revenue }.last(quantity).reverse
  end

  def total_revenue
    successful.joins(:invoice_items).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"')
  end

  def self.most_items(quantity)
    all.sort_by { |item| item.total_items }.last(quantity).reverse
  end

  def total_items
    successful.joins(:invoice_items).sum('"invoice_items"."quantity"')
  end

  def successful
    invoices.successful
  end
end
