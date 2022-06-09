class PartiesController < ApplicationController

  def show
    party_info = PartyFacade.find_party_by_id(params[:id])
    @party = party_info[0]
    @players = party_info[1]
  end

  def update
    PartyFacade.add_player_to_party(params[:user_id], params[:player_id])
    redirect_to "/parties/#{params[:user_id]}"
  end
end
