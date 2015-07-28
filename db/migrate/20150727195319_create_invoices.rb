class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :merchant, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.string :status
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
