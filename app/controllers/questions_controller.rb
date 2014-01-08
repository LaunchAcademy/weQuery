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
    @question = Question.new(question_params) do |q|
      q.session = parent
      q.user = current_user
    end

    if current_user && @question.save
      redirect_to session_questions_path(parent),
        notice: "Question successfully posted"
    else
      questions
      render "index"
    end
  end

  protected
  def questions
    @questions ||= parent.questions.non_expired
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
