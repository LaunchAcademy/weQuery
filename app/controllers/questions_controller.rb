class QuestionsController < ApplicationController
  before_action :authenticate_user!

  inherit_resources
  belongs_to :session,
    finder: :find_using_slug

  respond_to :json, only: :index

  def index
    @question = Question.new
    questions
    super do |format|
      format.json { render json: @questions }
    end
  end

  def create
    create! do |success, failure|
      success.html { redirect_to session_questions_path(parent) }
      failure.html do
        questions
        render 'index'
      end
    end
  end

  protected
  def create_resource(question)
    question.session = parent
    question.user = current_user
    super
  end

  def questions
    @questions ||= parent.questions.non_expired
  end

  def permitted_params
    params.permit(question: :body)
  end

end
