class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all.limit(10)
    @recipe_ing = RecipeIng.new
    @recipe = Recipe.find(params[:recipe_id])
  end

end
