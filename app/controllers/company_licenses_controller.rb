class CompanyLicensesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:dashboard, :index, :show]

  def dashboard

    @spend_per_app = CompanyLicense
    .select("licenses.name AS key, '[logo temp]' AS logo, SUM(total_purchase_price) AS expense")
    .joins(:license_transactions, :license)
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)

    @spend_per_department = CompanyLicense
    .select("users.department AS key, '[logo temp]' AS logo, SUM(license_transactions.total_purchase_price) AS expense")
    .joins({ license_transactions: :owner })
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)

    @utilization_per_app = LicenseTransaction
    .select("licenses.name AS app, '[logo temp]' AS logo, SUM(license_transactions.user_licenses_purchased) AS capacity, SUM(company_licenses.active_users) AS usage, SUM(company_licenses.active_users) * 100 / SUM(license_transactions.user_licenses_purchased) AS utilization")
    .joins({company_license: :license})
    .where(company_licenses: {company: current_user.company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .group(:app)
    .order(utilization: :asc)
    .limit(5)

  end

  def index
    @licenses = LicenseTransaction.all
  end

# Only temporary Axel, don't panic

  def show
     @licenses = LicenseTransaction.all
  end

end
