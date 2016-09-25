class Survey < ActiveRecord::Base
  validates :title, presence: true

  has_many :questions, :dependent => :restrict_with_error
end
