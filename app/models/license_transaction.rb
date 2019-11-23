class LicenseTransaction < ApplicationRecord
  belongs_to :company_license
  belongs_to :owner, class_name: 'User'

  FAKE_EVENTS = [
    {
      "title": "Event 1",
      "start": "2019-11-05T09:00:00",
      "end": "2019-11-05T18:00:00"
    },
    {
      "title": "Event 2",
      "start": "2019-11-08",
      "end": "2019-11-10"
    },
    {
      "title": "Event 3",
      "start": "2019-12-08",
      "end": "2019-12-10"
    }
  ]

  def generate_expiry_date(days)
    self.expiry_date = purchase_date + days
    save
  end

  scope :aggregated_capacity, -> (company) {
    joins(:company_license)
    .where(company_licenses: {company: company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .sum(:user_licenses_purchased)
  }

  scope :utilization_per_app, -> (company) {
    select("
    licenses.name AS app, max(licenses.logo_url) AS logo,
    SUM(license_transactions.user_licenses_purchased) AS capacity,
    SUM(company_licenses.active_users) AS usage,
    SUM(company_licenses.active_users) * 100 / SUM(license_transactions.user_licenses_purchased) AS utilization,
    (SUM(license_transactions.user_licenses_purchased) - SUM(company_licenses.active_users)) * MIN(licenses.avg_license_cost) AS potential_saving
    ")
    .joins({company_license: :license})
    .where(company_licenses: {company: company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .group(:app)
    .order(utilization: :asc)
    .limit(5)
  }
end
