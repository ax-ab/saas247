class CreateLicenseTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :license_transactions do |t|
      t.references :company_license, foreign_key: true
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
