class QuestionsController < ApplicationController
  before_action :authenticate_user!

  inherit_resources
  belongs_to :session,
    finder: :find_using_slug

  respond_to :json, only: :index

  def index
    @question = Question.new
    @questions = parent.questions.non_expired
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
      @questions = Question.all
      render "index"
    end
  end

  def vote
    question = Question.find(params[:question_id])
    vote = Vote.new()
    vote.user_id = current_user.id
    vote.question_id = question.id
    if vote.save
      question.check_state?
      redirect_to session_questions_path(question.session)
    else
      redirect_to session_questions_path(question.session)
    end
  end

  protected

  def question_params
    params.require(:question).permit(:body)
  end

end
