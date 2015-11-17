class LuvliItem < ActiveRecord::Base
  belongs_to :luv_list

  validates :content, presence: true
  validates :content, length: { minimum: 3 }

  scope :complete, -> { where("completed_at is not null") }
  scope :incomplete, -> { where(completed_at: nil) }

  def completed?
    !completed_at.blank?

  end
end