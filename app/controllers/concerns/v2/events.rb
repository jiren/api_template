module V2
  class Events < BaseResource

    def show
      event = Event.where(id: params[:id]).first

      if event
        render(event)
      else
        render({ message: 'event not found'}, :not_found)
      end
    end
  end
end
