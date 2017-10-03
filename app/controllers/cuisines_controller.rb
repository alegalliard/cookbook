class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end
  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to cuisine_url(@cuisine.id)
    else
      flash[:error] = 'Você deve informar o nome da cozinha'
      redirect_to new_cuisine_path
    end
  end
  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
