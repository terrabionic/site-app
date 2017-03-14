class CreateJoinTableBranchCompany < ActiveRecord::Migration
  def change
    create_join_table :Branches, :Companies do |t|
      t.index [:branch_id, :company_id]
      t.index [:company_id, :branch_id]
    end
  end
end
