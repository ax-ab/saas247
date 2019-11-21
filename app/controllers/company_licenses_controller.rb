class CompanyLicensesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:dashboard, :index, :show]
include ActionView::Helpers::NumberHelper

  def dashboard
    #Applications
    @total_applications = CompanyLicense
    .joins(:license)
    .where(company: current_user.company)
    .count('distinct name')

    # https://apidock.com/rails/ActionView/Helpers/NumberHelper/number_to_currency
    spend_current_month = get_spend_from_dates(Date.today.beginning_of_month, Date.today.end_of_month)
    @spend_current_month = number_to_currency(spend_current_month, unit: "€", separator: ",", delimiter: ".", precision: 0)

    spend_previous_month = get_spend_from_dates(Date.today.last_month.beginning_of_month, Date.today.last_month.end_of_month)

    @spend_trend_month = (((spend_current_month - spend_previous_month).to_f / spend_previous_month.to_f) * 100).round

    spend_one_year_back = get_spend_from_dates((Date.today - 365), Date.today)
    @spend_one_year_back = number_to_currency(spend_one_year_back, unit: "€", separator: ",", delimiter: ".", precision: 0)

    aggregated_usage = CompanyLicense
    .where(company: current_user.company)
    .sum(:active_users)

    aggregated_capacity = LicenseTransaction
    .joins(:company_license)
    .where(company_licenses: {company: current_user.company})
    .where("'#{Date.today}' BETWEEN license_transactions.purchase_date AND license_transactions.expiry_date")
    .sum(:user_licenses_purchased)

    @utilization = ((aggregated_usage.to_f / aggregated_capacity.to_f) * 100).round
  end

  def index
    @companyLicenses = CompanyLicense.all
  end

  def show
     @companyLicense = CompanyLicense.find(params[:id])
  end

  def get_spend_from_dates(start_date, end_date)
    CompanyLicense
    .joins(:license_transactions)
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: start_date..end_date})
    .sum(:total_purchase_price)
  end

end
