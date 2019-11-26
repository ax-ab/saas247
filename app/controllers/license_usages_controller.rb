class LicenseUsagesController < ApplicationController

  layout 'license_usage'

  def new
    @user = User.find(params[:user_id])
    @license_usage = LicenseUsage.new
  end

  def create
    raise
  end

end
