class AddColumnsToLicenseTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :license_transactions, :user_licenses_purchased, :integer
    add_column :license_transactions, :total_purchase_price, :integer
    add_column :license_transactions, :purchase_date, :date
    add_column :license_transactions, :expiry_date, :date
  end
end
