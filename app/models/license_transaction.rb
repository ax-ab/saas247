class LicenseTransaction < ApplicationRecord
  belongs_to :company_license
  belongs_to :owner, class_name: 'User'

  def generate_expiry_date(days)
    self.expiry_date = purchase_date + days
    save
  end
end
