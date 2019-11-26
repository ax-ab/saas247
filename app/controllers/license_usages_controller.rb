class LicenseUsagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  layout 'license_usage'

  def new
    @user = User.find(params[:user_id])
    @license_usage = LicenseUsage.new
  end

  def create
    @user = User.find(params[:user_id])
    @company_licenses = params[:usage][:company_license_ids].reject { |l| l.empty? }

    @company_licenses.each do |company_license|
      @license_usage = LicenseUsage.new
      @license_usage.company_license_id = company_license
      @license_usage.user_id = @user.id
      @license_usage.save
    end

    render :thank_you
  end

  def user_survey
    @user = User.find(params[:user_id])
    UserMailer.with(user: @user).usage.deliver_now
    redirect_to usage_path, notice: "Survey sent to #{@user.first_name} #{@user.last_name}"
  end

  def all_survey
    User.all.each do |user|
      UserMailer.with(user: user).usage.deliver_now
    end
    redirect_to usage_path, notice: "Survey sent to everyone"
  end
end
