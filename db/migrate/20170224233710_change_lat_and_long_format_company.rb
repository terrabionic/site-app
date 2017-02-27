class ChangeLatAndLongFormatCompany < ActiveRecord::Migration
  def change
  	change_column :companies, :latitude, :float
    change_column :companies, :longitude, :float
  end
end
