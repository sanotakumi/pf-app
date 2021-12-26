class HomesController < ApplicationController
  def top
    @recipes = Recipe.all
  end
end
