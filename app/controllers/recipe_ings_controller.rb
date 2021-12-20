class RecipeIngsController < ApplicationController
   before_action :authenticate_user!

  def index
    @recipe_ings = current_user.recipe_ings
    @total_cal = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_cal }
    @total_protein = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_protein }
    @total_fat = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_fat }
    @total_carbon = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_carbon }
    @total_salt = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_salt }
    @total_vit_b1 = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_vit_b1 }
    @total_vit_b2 = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_vit_b2 }
    @total_vit_c = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_vit_c }
  end

  def create

    recipe_ing = RecipeIng.new
    recipe_ing.user_id = current_user.id
    recipe_ing.recipe_id = params[:recipe_id]
    recipe_ing.ingredient_id = params[:ingredient_id]
    #ingredient_id = params[:recipe_ing][:ingredient_id]
    #quantity = params[:recipe_ing][:quantity]
    #recipe_ing = current_user.recipe_ings.find_by(ingredient_id: ingredient_id)
    if recipe_ing.save
      #recipe_ing.quantity = quantity.to_i
      #recipe_ing.save
      redirect_to recipe_ings_path

    #elsif
      #@recipe_ing.save
      #redirect_to current_user_recipe_ings_path

    else
      #@ingredient = Ingredient.find_by(id:@recipe_ing.ingredient.id)
      #@recipe_ings = RecipeIng.new
      #flash[:notice] = '個数を選択してください'
      #redirect_to ingredient_path
      #renderは前の画面の情報が残っている
      render :index
    end
  end

  def update
    @recipe_ing = RecipeIng.find(params[:id])
    if @recipe_ing.update
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    recipe_ing = RecipeIng.find(params[:id])
    recipe_ing.destroy
    redirect_to recipe_ings_path
  end

  def destroy_all
    current_user.recipe_ings.destroy_all
    redirect_to recipe_ings_path
  end



  private

  def recipe_ing_params
    # params.permit(:ingredient_id, :recipe_id, :quantity)
    #params.require(:recipe_ing).permit(:ingredient_id, :quantity)
  end
end
