class AddTypeToLicenses < ActiveRecord::Migration[5.2]
  def change
    add_column :licenses, :type, :string
  end
end
