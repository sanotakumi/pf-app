class RecipesController < ApplicationController

  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe  = Recipe.find(params[:id])
    ##@image = @racipe.image
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
    @recipe.destroy
    redirect_to recipe_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:image, :name, :explanation,)
    end

end
