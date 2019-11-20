class CompanyLicensesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:dashboard, :index, :show]

  def dashboard

  end

  def index
    @licenses = LicenseTransaction.all
  end

# Only temporary Axel, don't panic

  def show
     @licenses = LicenseTransaction.all
  end

end
