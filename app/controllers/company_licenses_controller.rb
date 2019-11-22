class CompanyLicensesController < ApplicationController
  include ActionView::Helpers::NumberHelper
  include DashboardHelper

  def dashboard
    ### TOP METRICS
    # https://apidock.com/rails/ActionView/Helpers/NumberHelper/number_to_currency
    @total_applications = CompanyLicense.company_applications_count(current_user.company)

    @spend_current_month = get_spend_from_dates(Date.today.beginning_of_month, Date.today.end_of_month)
    # @spend_current_month = number_to_currency(spend_current_month, unit: "€", separator: ",", delimiter: ".", precision: 0)

    spend_previous_month = get_spend_from_dates(Date.today.last_month.beginning_of_month, Date.today.last_month.end_of_month)

    @spend_trend_month = (((@spend_current_month - spend_previous_month).to_f / spend_previous_month.to_f) * 100).round

    @spend_one_year_back = get_spend_from_dates((Date.today - 365), Date.today)
    # @spend_one_year_back = number_to_currency(spend_one_year_back, unit: "€", separator: ",", delimiter: ".", precision: 0)

    aggregated_usage = CompanyLicense
    .where(company: current_user.company)
    .sum(:active_users)

    aggregated_capacity = LicenseTransaction
    .joins(:company_license)
    .where(company_licenses: {company: current_user.company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .sum(:user_licenses_purchased)

    # Send the above ones to view and calculate it there
    @utilization = ((aggregated_usage.to_f / aggregated_capacity.to_f) * 100).round

    ### BOTTOM CARD METRICS
    @spend_per_app = CompanyLicense
    .select("licenses.name AS key, max(licenses.logo_url) AS logo, SUM(total_purchase_price) AS expense")
    .joins(:license_transactions, :license)
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)

    @spend_per_department = CompanyLicense
    .select("users.department AS key, 'vendor-logos/department-placeholder.png' AS logo, SUM(license_transactions.total_purchase_price) AS expense")
    .joins({ license_transactions: :owner })
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)

    @utilization_per_app = LicenseTransaction
    .select("licenses.name AS app, max(licenses.logo_url) AS logo, SUM(license_transactions.user_licenses_purchased) AS capacity, SUM(company_licenses.active_users) AS usage, SUM(company_licenses.active_users) * 100 / SUM(license_transactions.user_licenses_purchased) AS utilization")
    .joins({company_license: :license})
    .where(company_licenses: {company: current_user.company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .group(:app)
    .order(utilization: :asc)
    .limit(5)

    @renewals_current_month = get_renewals_from_dates(Date.today, Date.today.end_of_month)
    @renewals_december = get_renewals_from_dates(Date.today.next_month.beginning_of_month, Date.today.next_month.end_of_month)

    test2 = LicenseTransaction
    .select("licenses.name AS app,
      max(licenses.logo_url) AS logo, SUM(license_transactions.user_licenses_purchased) AS capacity,
      SUM(company_licenses.active_users) AS usage,
      SUM(company_licenses.active_users) * 100 / SUM(license_transactions.user_licenses_purchased) AS utilization,
      licenses.license_type AS types,
      license_transactions.commitment_period AS com,
      CASE
        WHEN license_transactions.commitment_period = 'yearly'
        THEN SUM(total_purchase_price) / SUM(user_licenses_purchased) / 12
        ELSE SUM(total_purchase_price) / SUM(user_licenses_purchased)
      END AS cost2
      ")
    .joins({company_license: :license})
    .where(company_licenses: {company: current_user.company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .group('app, types, com')
    .order(utilization: :asc)
    .limit(5)
    .select("licenses.name AS app, ROUND(AVG(cost2)) as average_monthly_cost")

    # cost_per_license = LicenseTransaction.
    # select("licenses.name AS app, license_transactions.commitment_period AS com, SUM(license_transactions.user_licenses_purchased) AS user_licenses_purchased, SUM(total_purchase_price) / SUM(user_licenses_purchased) AS cost_per_license")
    # .joins({company_license: :license})
    # .where(company_licenses: {company: current_user.company})
    # .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    # .group('app, com')



raise
# SELECT
#   licenses.name AS app,
# --  licenses.license_type AS types,
#   license_transactions.commitment_period AS com,
# --  SUM(license_transactions.user_licenses_purchased) AS user_licenses_purchased,
# --  SUM(license_transactions.total_purchase_price) AS total_purchase_price,
#   SUM(total_purchase_price) / SUM(user_licenses_purchased) AS cost_per_license
# FROM
#   license_transactions
#   JOIN company_licenses ON company_licenses.id = license_transactions.company_license_id
#   JOIN licenses ON licenses.id = company_licenses.license_id
# WHERE
#   '2019-11-22' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date
#   AND
#   company_licenses.company_id = 36
# GROUP BY
#   app,
# --  types,
#   com
# --  licenses.license_type





  end

  def index
    @companyLicenses = CompanyLicense.all
  end

  def show
     @companyLicense = CompanyLicense.find(params[:id])
  end

end
