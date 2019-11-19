class AddActiveUsersToCompanyLicenses < ActiveRecord::Migration[5.2]
  def change
    add_column :company_licenses, :active_users, :integer
  end
end
