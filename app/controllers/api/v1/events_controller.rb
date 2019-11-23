class Api::V1::EventsController < Api::V1::BaseController
  def index
    @events = LicenseTransaction::FAKE_EVENTS
  end
end
