class Question < ActiveRecord::Base
  belongs_to :survey

  validates :title, presence: true
  validates :grade, presence: true,
                    numericality: true

end
