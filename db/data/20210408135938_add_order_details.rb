class AddOrderDetails < ActiveRecord::Migration[6.1]
  def up
    random = Random.new
    50.times do
      product = Product.find(random.rand(1..4))
      OrderDetail.create!(
        order_id: random.rand(1..15),
        product_id: product.id,
        quantity: random.rand(1..2),
        price: product.price
      )
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
