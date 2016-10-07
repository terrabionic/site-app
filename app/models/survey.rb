class Survey < ActiveRecord::Base
  validates :title, presence: true

  has_many :questions, :dependent => :restrict_with_error
  has_many :replies, :dependent => :restrict_with_error
end
