class Session < ActiveRecord::Base
  has_many :questions,
    dependent: :destroy,
    inverse_of: :session

  validates_uniqueness_of :name

  validates_presence_of :name

  is_sluggable :name

  def archive
    return false if archived?
    self.archived_at = Time.now
    self.save
  end

  def archived?
    self.archived_at.present?
  end

  class << self
    def active
      where(archived_at: nil)
    end
  end
end
