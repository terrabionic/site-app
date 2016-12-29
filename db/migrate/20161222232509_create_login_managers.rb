class CreateLoginManagers < ActiveRecord::Migration
  def change
    create_table :login_managers do |t|
      t.string :email_contact
      t.text :about_us
      t.text :privacy
      t.text :we_do

      t.timestamps null: false
    end
  end
end
