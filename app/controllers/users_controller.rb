class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @recipes = current_user.recipes
  end
  
end
