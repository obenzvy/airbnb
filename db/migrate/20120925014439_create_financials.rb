class CreateFinancials < ActiveRecord::Migration
  def change
    create_table :financials do |t|
      t.integer :rent
      t.integer :fixed_costs
      t.integer :utilities
      t.integer :days
      t.integer :price

      t.timestamps
    end
  end
end
