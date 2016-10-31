class PossibleAnswer < ActiveRecord::Base
  belongs_to :question

  validates :title, presence: true
  validates :description, presence: true
  validates :grade, presence: true, numericality: true

  validates :question, presence: true

end
