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
      t.string :stage, default: 'Prealta'
      t.references :sector, index: true, foreign_key: true
      t.string :name
      t.string :email_user
      t.boolean :active, default: true
      t.references :agent, index: true, foreign_key: true
      t.references :emprered, index: true, foreign_key: true
      t.string :company_type , default: ''
      t.string :vat, default: ''
      t.string :street, default: ''
      t.string :street2, default: ''
      t.string :city, default: ''
      t.string :cel, default: ''
      t.date :date_start
      t.date :date_end
      t.string :line_business, default: ''
      t.integer :num_workers, default: 0
      t.string :annual_sales, default: ''
      t.text :company_history, default: ''
      t.string :company_products, default: ''
      t.string :company_market, default: ''
      t.string :company_problems, default: ''
      t.string :name_director, default: ''
      t.string :staff_interviewed, default: ''
      t.string :survey_period, default: ''
      t.string :name_created, default: ''
      t.boolean :completed, default: false

      t.references :user_login, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
