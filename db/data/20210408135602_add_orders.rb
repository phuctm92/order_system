class AddOrders < ActiveRecord::Migration[6.1]
  def up
    random = Random.new
    15.times do
      Order.create!(user_id: random.rand(1..5), status: random.rand(0..4))
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
