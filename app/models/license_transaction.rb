class LicenseTransaction < ApplicationRecord
  belongs_to :company_license
  belongs_to :owner, class_name: 'User'
end
