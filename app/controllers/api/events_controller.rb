class Api::EventsController < ApiController

  def index
    respond_to do |format|
      format.json_v1 { V1::Events.new(self).all }

      # NOTE: If index api is not changed in v2 in that case we can use same code of v1
      format.json_v2 { V1::Events.new(self).all }
    end
  end

  def create
    respond_to do |format|
      format.json_v1 { V1::Events.new(self).create }
      # NOTE: If index api is not changed in v2 in that case we can use same code of v1
      format.json_v2 { V1::Events.new(self).create }
    end
  end

  def show
    respond_to do |format|
      format.json_v1 { V1::Events.new(self).show }
      format.json_v2 { V2::Events.new(self).show }
    end
  end

end
