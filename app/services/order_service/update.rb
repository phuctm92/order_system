module OrderService
  class Update < BaseService
    def call(order:, params:)
      return if order.nil? || params.nil?
      return error unless order.update(params.require(:order).permit(:status))

      # OrderUpdateStatusJob.perform_later(order.id)
      OrderMailer.update_status(order).deliver_now!
      success(order: order)
    end
  end
end