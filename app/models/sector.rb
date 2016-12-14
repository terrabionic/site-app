class Sector < ActiveRecord::Base
	validates :name, presence: true
	has_attached_file :image, styles: { medium: '200x200>', thumb: '48x48>' }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	has_many :companies, :dependent => :restrict_with_error
end
