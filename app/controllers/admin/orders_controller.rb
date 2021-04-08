module Admin
  class OrdersController < Admin::ApplicationController
    before_action :optimize_url, only: :index
    before_action :set_order, only: %i[show edit update destroy]

    def index
      @orders = OrderService::Search.call(search_params: params[:search], page: params[:page]).order_by_date!
    end

    def show
    end

    def edit
    end

    def update
      response = OrderService::Update.call(order: @order, params: params)
      if response[:status] == :success
        redirect_to admin_order_path(response[:order]), notice: 'Order was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def optimize_url
      return if params[:search].nil?

      email = params[:search][:email] if params[:search].key?(:email)
      status = params[:search][:status] if params[:search].key?(:status)
      page = params[:page] if params[:page].present?
      return redirect_to admin_orders_path(page: page) if email.blank? && status.blank?
    end

    def set_order
      @order = Order.find_by(params[:id])
    end
  end
end