class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from StandardError do |exception|
    Rails.logger.error("Error: #{exception.message}")
    render json: { error: "Internal Server Error" }, status: :internal_server_error
  end

  rescue_from ActiveRecord::RecordInvalid do |invalid|
    render json: {error: "Failed to create a new tournament, with error: #{invalid.record.errors.full_messages} - #{invalid.record.errors.details}"}, status: :internal_server_error
  end

end
