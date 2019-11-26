class CreateLicenseUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :license_usages do |t|
      t.references :company_license, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
