class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @history = History.all
  end
  
end