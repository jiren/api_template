class Api::V1::EventsController < Api::ApiController
  before_action :authenticate
  #before_action :authenticate_manual
  before_action :validate_rpm

  respond_to :json

  def index
    @events = Event.all

    respond_with @events
  end

end
