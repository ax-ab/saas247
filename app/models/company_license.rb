class CompanyLicense < ApplicationRecord
  belongs_to :license
  belongs_to :company
  has_many :license_transactions

  scope :company_applications_count, -> (company) {
    joins(:license)
    .where(company: company)
    .count('distinct name')
  }

end
