class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :category

  has_many :possible_answers
  has_many :answers

  validates :title, presence: true
  validates :category, presence: true
  validates :survey, presence: true

  def grade
    self.possible_answers.maximum("grade")
  end

end
