class ViewFrontController < ApplicationController

  def all_recipes
    @recipes = Recipe.all
  end


  def recipe_by_category
    @recipes = Recipe.where(category_id: params[:cat_id])
    #@categories = Category.find(params[:cat_id])
  end

  def recipe_by_user
  end
end
