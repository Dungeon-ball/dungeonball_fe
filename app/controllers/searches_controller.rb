class SearchesController < ApplicationController

  def index
    # require 'pry'; binding.pry
    if params[:search_by_name]
      @name = params[:search_by_name]
      @players = PlayerFacade.search_players_by_name(@name)
    end
  end
end
