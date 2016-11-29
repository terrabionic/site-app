class AddLogoToCompany < ActiveRecord::Migration
  def change
  end
  add_attachment :companies, :image_logo
end
