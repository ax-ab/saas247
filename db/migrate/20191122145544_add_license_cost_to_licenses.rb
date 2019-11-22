class AddLicenseCostToLicenses < ActiveRecord::Migration[5.2]
  def change
    add_column :licenses, :license_cost, :integer
  end
end
