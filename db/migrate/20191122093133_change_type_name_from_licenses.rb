class ChangeTypeNameFromLicenses < ActiveRecord::Migration[5.2]
  def change
    rename_column :licenses, :type, :license_type
  end
end
