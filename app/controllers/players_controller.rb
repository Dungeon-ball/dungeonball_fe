class PlayersController < ApplicationController

  def show
    @player = PlayerFacade.find_player_by_id(params[:id])
    if current_user
      @user = current_user.id
      @player_in_party = PartyFacade.player_in_party?(@user,params[:id])
    else
      @player_in_party = false
    end
  end
end
