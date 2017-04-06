class Type < ActiveRecord::Base
  belongs_to :subbranch
  validates :name, presence: true
  validates :code, presence: true
  validates :subbranch, presence: true
  has_and_belongs_to_many :companies
end
