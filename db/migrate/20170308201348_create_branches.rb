class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.references :subsector, index: true, foreign_key: true
      t.integer :code

      t.timestamps null: false
    end
  end
end
