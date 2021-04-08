class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false
      t.references :product, null: false
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
