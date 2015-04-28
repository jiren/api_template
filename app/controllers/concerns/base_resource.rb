class BaseResource
  def initialize(controller)
    @ctrl = controller
  end

  def render(data, status = 200)
    @ctrl.render(json: data, status: status)
  end

  def params
    @ctrl.params
  end

end
