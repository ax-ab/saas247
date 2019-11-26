class LicenseUsagesController < ApplicationController

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
    # render :new

  end

  # def create
  #   @superpower = Superpower.find(params[:superpower_id])
  #   @booking = Booking.new(booking_params)
  #   @booking.rentee = current_user
  #   @booking.superpower_id = @superpower.id
  #   if @booking.save
  #     redirect_to profile_path, notice: "Booking successful"
  #   else
  #     render template: 'superpowers/show'
  #   end
  # end

  # private

  # def license_usage_params
  #   params.require(:license_usage).permit(:start_date, :end_date, :price, :disclaimer)
  # end

end
