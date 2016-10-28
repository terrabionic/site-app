class Category < ActiveRecord::Base
  has_many :questions, :dependent => :restrict_with_error

  validates :title, presence: true
end
