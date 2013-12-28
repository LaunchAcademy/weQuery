class Session < ActiveRecord::Base
  has_many :questions,
    dependent: :destroy,
    inverse_of: :session

  validates_uniqueness_of :name

  validates_presence_of :name
end
