class Notice < ActiveRecord::Base
  belongs_to :sector
  has_attached_file :image_notice, styles: { medium: '200x200>', thumb: '48x48>' }
  validates_attachment_content_type :image_notice, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :title, presence: true
  validates :link, presence: true
  validates :sector, presence: true
  validates :date_pub, presence: true
  

end
