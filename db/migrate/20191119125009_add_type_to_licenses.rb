class AddTypeToLicenses < ActiveRecord::Migration[5.2]
  def change
    add_column :licenses, :license_type, :string
  end
end
