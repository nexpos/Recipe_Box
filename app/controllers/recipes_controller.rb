class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @recipe = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
    @categories = Category.all
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Successfully saved new recipe"
    else
      render 'new'
    end
  end

    def edit
      @categories = Category.all
    end

    def update
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        render 'edit'
      end
    end

    def destroy
      @recipe.destroy
      redirect_to root_path, notice: "Successfully deleted recipe"
    end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :category_id, ingredients_attributes:[:id, :name, :_destroy], directions_attributes:[:id, :step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
