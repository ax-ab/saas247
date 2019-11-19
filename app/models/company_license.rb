class CompanyLicense < ApplicationRecord
  belongs_to :license
  belongs_to :company
  has_many :license_transactions
end
