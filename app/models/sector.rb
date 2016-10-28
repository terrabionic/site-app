class Sector < ActiveRecord::Base
	validates :name, presence: true
end
