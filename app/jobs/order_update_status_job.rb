class OrderUpdateStatusJob < ApplicationJob
  queue_as :mailers

  def perform(order_id)
    order = Order.find_by(id: order_id)
    OrderMailer.update_status(order).deliver_now! if order.present?
  end
end