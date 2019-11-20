class AddCommitmentPeriodToLicenseTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :license_transactions, :commitment_period, :string
  end
end
