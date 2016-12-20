class AddMunicipioToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :municipio, index: true, foreign_key: true
    add_column :companies, :latitude, :string, :default => ''
    add_column :companies, :longitude, :string, :default => ''
  end
end
