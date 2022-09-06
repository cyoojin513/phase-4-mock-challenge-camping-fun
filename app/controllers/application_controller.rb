class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  include ActionController::Cookies

  private

  def render_invalid(invalid)
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end

end
