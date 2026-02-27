class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :title, null: false
      t.string :colony_name, null: false
      t.string :plot_number, null: false
      t.decimal :size, precision: 10, scale: 2
      t.decimal :price, precision: 12, scale: 2
      t.string :status, default: 'available', null: false
      t.text :description

      t.timestamps
    end

    add_index :properties, :status
    add_index :properties, :colony_name
    add_index :properties, :plot_number
  end
end
