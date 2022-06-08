class PlayersController < ApplicationController

  def show
    @player = PlayerFacade.find_player_by_id(params[:id])
  end

  def add_to_party
    binding.pry
    redirect_to '/parties/show'
  end
end
