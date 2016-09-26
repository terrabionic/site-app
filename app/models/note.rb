class Note < ActiveRecord::Base
  belongs_to :question

  validates :title, presence: true
  validates :description, presence: true
  validates :points, presence: true, numericality: true
end
