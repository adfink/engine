class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def total_cost
    (self.quantity * self.unit_price).to_digits
  end
end
