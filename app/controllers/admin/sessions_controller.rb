module Admin
  class SessionsController < ApplicationController
    inherit_resources
    before_action :authenticate_admin!

    def create
      create! do |success, failure|
        success.html { redirect_to session_questions_path(resource) }
      end
    end

    def permitted_params
      params.permit(session: [:name])
    end
  end
end
