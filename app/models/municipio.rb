class Municipio < ActiveRecord::Base
  belongs_to :region, class_name: 'Region'
  validates :name, presence: true
  has_many :companies, :dependent => :restrict_with_error
end
