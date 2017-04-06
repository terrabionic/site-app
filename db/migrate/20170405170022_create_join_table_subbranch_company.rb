class CreateJoinTableSubbranchCompany < ActiveRecord::Migration
  def change
    create_join_table :Subbranches, :Companies do |t|
      t.index [:subbranch_id, :company_id]
      t.index [:company_id, :subbranch_id]
    end
  end
end
