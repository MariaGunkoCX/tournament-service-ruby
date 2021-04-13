class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from StandardError do |exception|
    Rails.logger.error("Error: #{exception.message}")
    render json: { error: "Internal Server Error" }, status: :internal_server_error
  end

end
