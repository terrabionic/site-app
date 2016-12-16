class AddActivityToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :activity, index: true, foreign_key: true
  end
end
