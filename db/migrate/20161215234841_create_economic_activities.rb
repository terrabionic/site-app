class CreateEconomicActivities < ActiveRecord::Migration
  def change
    create_table :economic_activities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
