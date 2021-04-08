class Admin::DashboardController < Admin::ApplicationController
  def index
    @users = User.customers
  end
end
