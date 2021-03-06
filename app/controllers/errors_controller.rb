class ErrorsController < ApplicationController
  layout 'error'
  # def show
  #   render status_code.to_s, status: (params[:code] || 500)
  # end

  def not_found
    render :status => 404
  end

  def unacceptable
    render :status => 422
  end

  def internal_error
    render :status => 500
  end
end
