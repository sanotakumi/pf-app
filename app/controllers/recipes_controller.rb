class RecipesController < ApplicationController

  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @menu = Menu.new
    @user = current_user
    @recipe_ings = @recipe.recipe_ings
    # @recipe.cal = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_cal }
    # @recipe.protein = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_protein }
    # @recipe.fat = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_fat }
    # @recipe.carbon = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_carbon }
    # @recipe.salt = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_salt }
    # @recipe.vit_b1 = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_vit_b1 }
    # @recipe.vit_b2 = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_vit_b2 }
    # @recipe.vit_c = @recipe_ings.inject(0) { |sum, ingredient| sum + ingredient.sum_of_ing_vit_c }
  end

  def new
    @recipe = Recipe.new
    @user = current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "新しいレシピが登録されました"
    else
      flash.now[:alert] = 'レシピの新規登録に失敗しました。'
      render "new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:image, :name, :explanation, :cal, :protein, :fat, :carbon, :salt, :vit_b1, :vit_b2, :vit_c)
    end

end
