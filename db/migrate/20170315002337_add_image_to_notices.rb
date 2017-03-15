class AddImageToNotices < ActiveRecord::Migration
  def change
  end
  add_attachment :notices, :image_notice
end
