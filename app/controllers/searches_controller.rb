class SearchesController < ApplicationController

  def index
    @players = PlayerFacade.search_players_by_name(params[:name])
  end
end
