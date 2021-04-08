module OrderService
  class Search < BaseService
    def call(search_params:, page: 1)
      email = search_params[:email] if search_params&.key?(:email)
      status = search_params[:status] if search_params&.key?(:status)
      return Order.page(page) if email.nil? && status.nil?

      orders =  if email.present? && status.present?
                  Order.joins(:user).where('email like ? AND status = ?', "%#{email}%", Order.statuses[status])
                elsif email.present?
                  Order.joins(:user).where('email like ?', "%#{email}%")
                elsif status.present?
                  Order.where(status: status)
                end

      orders.page(page)
    end
  end
end