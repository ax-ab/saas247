class CompanyLicensesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:dashboard, :index, :show]

  def dashboard

    @top_spend_apps = CompanyLicense
    .select("licenses.name AS key, '[logo temp]' AS logo, SUM(total_purchase_price) AS expense")
    .joins(:license_transactions, :license)
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)

    @spend_by_department = CompanyLicense
    .select("users.department AS key, '[logo temp]' AS logo, SUM(license_transactions.total_purchase_price) AS expense")
    .joins({ license_transactions: :owner })
    .where(company: current_user.company)
    .where(license_transactions: {purchase_date: Date.today-365..Date.today})
    .group('key')
    .order(expense: :desc)
    .limit(5)



# Artist.select("artists.name, COUNT(tracks.id)")
#         .joins(albums: { tracks: :genre })
#
# .where(genres: { name: genre_name })
#         .group('artists.name')
#         .order('COUNT(*) DESC')
#         .limit(5)



  end

  def index
    @licenses = LicenseTransaction.all
  end

# Only temporary Axel, don't panic

  def show
     @licenses = LicenseTransaction.all
  end

end
