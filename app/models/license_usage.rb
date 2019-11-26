class LicenseUsage < ApplicationRecord
  validates :company_license_id, uniqueness: { scope: :user_id }
end
