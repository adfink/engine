class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice


  validates :item_id, presence: true
  validates :invoice_id, presence: true
  validates :unit_price, presence: true
  validates :quantity, presence: true

  def total_cost
    (self.quantity * self.unit_price).to_digits
  end
end
