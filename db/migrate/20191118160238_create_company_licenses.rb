class CreateCompanyLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :company_licenses do |t|
      t.references :license, foreign_key: true
      t.references :company, foreign_key: true
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
