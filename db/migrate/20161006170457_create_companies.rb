class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :role, default: 'company'
      t.string :address
      t.string :phone
      t.string :email
      t.string :name_agent
      t.string :state, default: 'Nuevo'
      t.references :sector, index: true, foreign_key: true
      t.string :name
      t.string :email_user
      t.boolean :active, default: true
      t.references :agent, index: true, foreign_key: true
      t.string :company_type
      t.string :vat
      t.string :street
      t.string :street2
      t.string :city
      t.string :cel
      t.date :date_start
      t.string :line_business
      t.integer :num_workers
      t.string :annual_sales
      t.text :company_history
      t.string :company_products
      t.string :company_market
      t.string :company_problems
      t.string :name_director
      t.string :staff_interviewed
      t.string :survey_period
      t.string :name_created
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
