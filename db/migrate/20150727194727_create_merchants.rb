class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.timestamp :updated_at
      t.timestamp :created_at
    end
  end
end
