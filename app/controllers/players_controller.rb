class PlayersController < ApplicationController

  def show
    @player = PlayerFacade.find_player_by_id(params[:id])
  end
end
