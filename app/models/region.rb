class Region < ActiveRecord::Base
	validates :name, presence: true
	has_many :municipios, :dependent => :restrict_with_error
end
