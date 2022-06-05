class PartiesController < ApplicationController

  def show
    @party = PartyFacade.find_party_by_id(params[:id])
    party = @party[0]
    players = @party[1]
  end
end
