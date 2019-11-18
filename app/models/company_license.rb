class CompanyLicense < ApplicationRecord
  belongs_to :license
  belongs_to :company
  belongs_to :owner, class_name: 'User'
  has_many :license_transactions
end
