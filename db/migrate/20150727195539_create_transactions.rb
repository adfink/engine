class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :invoice, index: true, foreign_key: true
      t.string :result
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :credit_card_number
      t.string :credit_card_expiration_date
    end
  end
end
