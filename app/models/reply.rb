class Reply < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  belongs_to :user, class_name: 'User'

  accepts_nested_attributes_for :answers
end
