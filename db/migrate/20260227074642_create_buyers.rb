class CreateBuyers < ActiveRecord::Migration[8.0]
  def change
    create_table :buyers do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.references :property, null: false, foreign_key: true
      t.decimal :sale_price, precision: 12, scale: 2
      t.date :purchase_date
      t.text :review

      t.timestamps
    end

    add_index :buyers, :phone
  end
end
