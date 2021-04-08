class OrderMailer < ApplicationMailer
  def update_status(order)
    @order = order
    mail(to: @order.user.email,
         subject: "Update order'status in OrderSys")
  end
end
