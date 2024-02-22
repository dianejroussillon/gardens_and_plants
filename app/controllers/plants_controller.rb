class PlantsController < ApplicationController
  def create
    @plant = Plant.new(plant_params)
    @plant.garden = Garden.find(params[:garden_id])
    if @plant.save
      redirect_to garden_path(@plant.garden)
      # relire toute la méthode, puis rendre la vue
    else
      render 'gardens/show'
      # rendre la vue
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
