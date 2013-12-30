module Admin
  class DashboardController < ApplicationController

    before_action :is_admin?

    def index
      @important_questions = Question.importance('important')
      @sent_questions = Question.importance('sent')
      @asked_questions = Question.importance('asked')
    end

    protected

    def is_admin?
      if !current_user || !current_user.admin
        redirect_to questions_path
      end
    end

  end
end
