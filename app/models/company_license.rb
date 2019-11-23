class CompanyLicense < ApplicationRecord
  belongs_to :license
  belongs_to :company
  has_many :license_transactions

  scope :company_applications_count, -> (company) {
    joins(:license)
    .where(company: company)
    .count('distinct name')
  }

  scope :aggregated_usage, -> (company) {
    where(company: company)
    .sum(:active_users)
  }

  scope :spend_per_app, -> (company) {
    select("
    licenses.name AS key, max(licenses.logo_url) AS logo,
    SUM(total_purchase_price) AS expense
    ")
    .joins(:license_transactions, :license)
    .where(company: company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)
  }

  scope :spend_per_department, -> (company) {
    select("
    users.department AS key,
    'vendor-logos/department-placeholder.png' AS logo,
    SUM(license_transactions.total_purchase_price) AS expense
    ")
    .joins({ license_transactions: :owner })
    .where(company: company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)
  }
end
