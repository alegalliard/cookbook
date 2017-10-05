class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def update
    # @recipe.errors.any?
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipe_url(@recipe.id)
    else
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      @recipe.errors.messages
      render :edit
    end
  end
  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:error] = 'Receita deletada com sucesso'
      redirect_to root_path
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_url(@recipe.id)
    else
      flash[:error] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
                                    :recipe_type_id,
                                    :cuisine_id,
                                    :difficulty,
                                    :cook_time,
                                    :ingredients,
                                    :method)
  end
end
