module Admin
  class ApplicationController < ActionController::Base
    before_action :authorize_admin!

    layout 'admin/layouts/application'

    protected

    def authorize_admin!
      authenticate_user!

      redirect_to root_path, alert: 'You must be an admin to do that' unless current_user.admin?
    end
  end
end
