class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.string :name
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
