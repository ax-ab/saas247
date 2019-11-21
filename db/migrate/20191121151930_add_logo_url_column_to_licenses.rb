class AddLogoUrlColumnToLicenses < ActiveRecord::Migration[5.2]
  def change
    add_column :licenses, :logo_url, :string
  end
end
