class Level < ActiveRecord::Base
	validates :title, presence: true
	has_attached_file :image, styles: { medium: '100x100>', thumb: '48x48>' }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	has_many :events, :dependent => :restrict_with_error
end
