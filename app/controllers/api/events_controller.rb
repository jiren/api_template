class Api::EventsController < ApiController

  def index
    respond_to do |format|
      format.json_v1 { V1::Events.new(self).all }
    end
  end

  def create
    respond_to do |format|
      format.json_v1 { V1::Events.new(self).create }
    end
  end

  def show
    respond_to do |format|
      format.json_v1 { V1::Events.new(self).show }
    end
  end

end
