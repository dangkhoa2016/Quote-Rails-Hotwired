class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.references :quote, null: false, foreign_key: true
      t.integer :quantity
      t.string :location
      t.date :purchase_date
      t.decimal :purchase_price
      t.date :expiration_date
      t.string :manufacturer
      t.string :serial_number
      t.text :notes

      t.timestamps
    end
  end
end
