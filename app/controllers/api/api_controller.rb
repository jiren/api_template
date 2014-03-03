class Api::ApiController < ActionController::Base

  private 

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.where(api_key: token).first
    end
  end

  # NOTE: For ref
  # Manual way of authenticate request
  def authenticate_manual 
    api_key = request.headers['X-Api-Key']
    @user = User.where(api_key: api_key).first if api_key

    unless @user
      head status: :unauthorized
      return false
    end
  end

  # Check request per min
  # You can add field to user table request per min or define constant. 
  # Here I am just passsing some random value
  def validate_rpm
    if ApiRpmStore.threshold?(@user.id.to_s, @user.api_rpm) # 10 request per min
      head status: :too_many_requests
      return false
    end
  end


end
