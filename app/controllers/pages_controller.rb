class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  layout 'landing-page'

  def index
  end
end
