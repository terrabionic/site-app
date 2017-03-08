class Branch < ActiveRecord::Base
  belongs_to :subsector
  validates :name, presence: true
  validates :code, presence: true
  validates :subsector, presence: true
  has_and_belongs_to_many :companies
end
