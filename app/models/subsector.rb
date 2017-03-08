class Subsector < ActiveRecord::Base
  belongs_to :sector
  validates :name, presence: true
  validates :code, presence: true
  validates :sector, presence: true
  has_many :companies, :dependent => :restrict_with_error
  has_many :branches, :dependent => :restrict_with_error
end
