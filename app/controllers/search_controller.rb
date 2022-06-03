class SearchsController < ApplicationController

  def index
    players = Player.find_all_by_name(params[:name])
  end
end
