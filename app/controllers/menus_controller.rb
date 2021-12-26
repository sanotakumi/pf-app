class MenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @menus = Menu.all
    @history = History.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id

    if current_user.menus.find_by(recipe_id: params[:menu][:recipe_id]).present?
      @menu = current_user.menus.find_by(recipe_id: params[:menu][:recipe_id])
      @menu.quantity += params[:menu][:quantity].to_i
      @menu.save
      redirect_to menus_path

    else
      @menu.save
      redirect_to menus_path
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(quantity: params[:quantity])
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end


  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_path(menu_id: params[:menu_id])
  end

  private

  def menu_params
    params.require(:menu).permit(:recipe_id, :quantity)

  end

end
