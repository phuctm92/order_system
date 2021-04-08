class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  after_create :update_order_total_price

  private

  def update_order_total_price
    price_by_quantity = quantity * price
    order.update!(total_price: order.total_price + price_by_quantity)
  end
end
