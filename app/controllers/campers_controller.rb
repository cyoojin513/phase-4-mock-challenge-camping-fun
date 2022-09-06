class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  before_action :find_camper, only: [:show]

  # GET '/campers'
  def index
    render json: Camper.all, status: :ok
  end

  # GET '/campers/:id'
  def show
    render json: @camper, status: :ok, serializer: CamperWithActivitiesSerializer
  end

  # POST '/campers'
  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def find_camper
    @camper = Camper.find(params[:id])
  end

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found(error)
    render json: { error: "Camper not found" }, status: :not_found
  end
end
