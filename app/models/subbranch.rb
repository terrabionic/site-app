class Subbranch < ActiveRecord::Base
  belongs_to :branch
  validates :name, presence: true
  validates :code, presence: true
  validates :branch, presence: true
  has_and_belongs_to_many :companies
  has_many :types, :dependent => :restrict_with_error
end
