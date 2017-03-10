class AddWebToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :web, :string
  end
end
