module DashboardHelper
  def get_spend_from_dates(start_date, end_date)
    CompanyLicense
    .joins(:license_transactions)
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: start_date..end_date})
    .sum(:total_purchase_price)
  end

  def get_renewals_from_dates(start_date, end_date)
    LicenseTransaction
    .select("licenses.name AS app, license_transactions.expiry_date AS expiry_date")
    .joins({company_license: :license})
    .where(company_licenses: {company: current_user.company})
    .where(expiry_date: start_date..end_date)
    .order(expiry_date: :desc)
  end
end
