module Admin
  class DashboardController < ApplicationController

    before_action :is_admin?

    def index

    end

    protected

    def is_admin?
      if !current_user || !current_user.admin
        redirect_to questions_path
      end
    end

  end
end
