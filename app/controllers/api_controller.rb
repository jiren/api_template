class ApiController < ActionController::Base

  before_action :authenticate!

  X_API_KEY = 'X-Api-Key'
  MIME_REGX = /^application\/vnd\.apitemplate\.v(\d)/

  private

  def authenticate!
    @api_client = User.where(api_key: request.headers[X_API_KEY]).first


    # NOTE: authentication based on api version.
    # i.e
    #
    # @api_client = ApiClient.where(api_key: request.headers[X_API_KEY])
    # @api_client = if api_version = 2
    #                @api_client.where(client_ip: request.remote_ip).first
    #              else
    #                @api_client.first
    #              end

    unless @api_client
      render json: { message: 'invalid api key' }, status: :unauthorized
      return false
    end
  end

  # parse version from from accept header value.
  def api_version
    @_a_v ||= request.headers['Accept'][MIME_REGX, 1].to_i
  end

end
