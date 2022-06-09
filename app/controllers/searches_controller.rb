class SearchesController < ApplicationController

  def index
    if params[:search_by_name]
      @name = params[:search_by_name]
      # require 'pry'; binding.pry
      @players = PlayerFacade.search_players_by_name(@name)
    end
  end
end
