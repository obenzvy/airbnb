class AddDurationToFinancials < ActiveRecord::Migration
  def change
    add_column :financials, :duration, :integer
  end
end
