class Question < ActiveRecord::Base
  belongs_to :survey

  validates :title, presence: true
  validates :value, presence: true,
                    numericality: true

end
