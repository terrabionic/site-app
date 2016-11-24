class AddNewBooleandoneToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :done, :boolean, default: false
  end
end
