class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate!

  private

  def authenticate!
    @current_user = Authentication.authenticate_request(request.headers['HTTP_AUTHORIZATION'])
    unless @current_user
      render json: { error: 'Not Authenticated' }, status: :unauthorized
    end
  end
end
