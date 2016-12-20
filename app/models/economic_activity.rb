class EconomicActivity < ActiveRecord::Base
	validates :name, presence: true
	has_many :companies, :dependent => :restrict_with_error
end
