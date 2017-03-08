class AddSubsectorToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :subsector, index: true, foreign_key: true
  end
end
