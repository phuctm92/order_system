class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0, index: true
      t.datetime :order_date
      t.float :total_price
      t.references :user, null: false

      t.timestamps
    end
  end
end
