class CompanyLicensesController < ApplicationController
  include DashboardHelper
  include ActionView::Helpers::NumberHelper

require 'json'
require 'open-uri'



  def dashboard
    @license_transactions = LicenseTransaction.all

    ### TOP METRICS
    @total_applications = CompanyLicense.company_applications_count(current_user.company)

    @spend_current_month = get_spend_from_dates(Date.today.beginning_of_month, Date.today.end_of_month)
    spend_previous_month = get_spend_from_dates(Date.today.last_month.beginning_of_month, Date.today.last_month.end_of_month)
    @spend_trend_month = (((@spend_current_month - spend_previous_month).to_f / spend_previous_month.to_f) * 100).round

    @spend_one_year_back = get_spend_from_dates((Date.today - 365), Date.today)

    aggregated_usage = CompanyLicense.aggregated_usage(current_user.company)
    aggregated_capacity = LicenseTransaction.aggregated_capacity(current_user.company)
    @utilization = ((aggregated_usage.to_f / aggregated_capacity.to_f) * 100).round

    ### BOTTOM CARD METRICS
    @spend_per_app = CompanyLicense.spend_per_app(current_user.company)
    @spend_per_department = CompanyLicense.spend_per_department(current_user.company)
    @utilization_per_app = CompanyLicense.index_query(current_user.company).sort_by { |hsh| hsh[:utilization] }.slice(0,5)

  end

  def index
    @company_licenses = CompanyLicense.all
    @licenses_aggregated = CompanyLicense.index_query(current_user.company)
  end

  def show
    @company_license = CompanyLicense.find(params[:id])
  end

  def usage

    url = "https://api.typeform.com/forms/RyFnZ0/responses"
    form_results_serialized = open(url, "Authorization" => "Bearer 5nfqD7rtaGvyXb3fXbPVAuzczXdfMxPo8N9typ8D6KQX", "Accept" => "application/json").read
    results = JSON.parse(form_results_serialized)['items']







# open("http://www.ruby-lang.org/en/",
#    "User-Agent" => "Ruby/#{RUBY_VERSION}",
#    "From" => "foo@bar.invalid",
#    "Referer" => "http://www.ruby-lang.org/")

  end

end
