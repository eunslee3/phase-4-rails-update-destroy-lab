class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_by
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = find_by
    plant.update(plant_params)
    render json: plant
  end

  def destroy
    plant = find_by
    plant.destroy
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_by
    Plant.find(params[:id])
  end

  def not_found
    render json: { error: "Plant not found" }, status: :not_found
  end

end
