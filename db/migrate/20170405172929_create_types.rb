class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.references :subbranch, index: true, foreign_key: true
      t.integer :code

      t.timestamps null: false
    end
  end
end
