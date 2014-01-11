class Question < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :questions

  belongs_to :session,
    inverse_of: :questions

  has_many :votes,
    inverse_of: :question,
    dependent: :destroy

  validates_presence_of :body

  def active_model_serializer
    QuestionSerializer
  end

  class << self
    def listing
      order('votes_count DESC, created_at')
    end
  end
end
