class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # GET '/activities'
  def index
    render json: Activity.all, status: :ok
  end

  # DELETE '/activities/:id'
  def destroy
    Activity.find(params[:id]).destroy
    head :no_content
  end

  private

  def render_not_found(error)
    render json: { error: "Activity not found" }, status: :not_found
  end
end
