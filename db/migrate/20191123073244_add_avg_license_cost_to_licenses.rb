class AddAvgLicenseCostToLicenses < ActiveRecord::Migration[5.2]
  def change
    add_column :licenses, :avg_license_cost, :integer
  end
end
