class AddSecurityDepositToFinancials < ActiveRecord::Migration
  def change
    add_column :financials, :security_deposit, :integer
  end
end
