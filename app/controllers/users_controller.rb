class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @recipes = current_user.recipes
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to user_path(@user), notice: "内容を変更しました"
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:name, :birthday, :gender,)
  end


end
