class VotesController < ApplicationController
  inherit_resources
  belongs_to :question

  def create
    create! do |success, failure|
      success.html { redirect_to session_questions_path(parent.session)}
      failure.html do
        redirect_to session_questions_path(parent.session),
          alert: 'Could not save vote'
      end
    end
  end

  def create_resource(obj)
    obj.user = current_user
    super.tap { obj.question.check_state? }

  end
end
