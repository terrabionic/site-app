class CreateSubbranches < ActiveRecord::Migration
  def change
    create_table :subbranches do |t|
      t.string :name
      t.references :branch, index: true, foreign_key: true
      t.integer :code

      t.timestamps null: false
    end
  end
end
