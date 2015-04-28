module V1
  class Events < BaseResource
    def all
      render(Event.all)
    end

    def create
      event = Event.create(event_params)
      render(event)
    end

    def show
      event = Event.where(id: params[:id]).first

      if event
        render(event.as_json(only: [:name, :occurred_at]))
      else
        render({ message: 'event not found'}, :not_found)
      end
    end

    private

    def event_params
      params.require(:event).permit(:name, :occurred_at)
    end
  end
end
