class CompanyLicensesController < ApplicationController
# skip_before_action :authenticate_user!, only: [:dashboard, :index, :show]

  def dashboard

  end

  def index
    @companyLicenses = CompanyLicense.all
  end

  def show
     @companyLicense = CompanyLicense.find(params[:id])
  end

end
