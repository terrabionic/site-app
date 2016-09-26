class Note < ActiveRecord::Base
  belongs_to :question

  validates :title, presence: true
  validates :description, presence: true
  validates :points, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :question, presence: true

  validates :points, lte_grade: true
end
