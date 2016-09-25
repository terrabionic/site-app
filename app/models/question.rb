class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :category
  has_many :notes, :dependent => :restrict_with_error

  validates :title, presence: true
  validates :category, presence: true
  validates :survey, presence: true
  validates :grade, presence: true,
                    numericality: true

end
