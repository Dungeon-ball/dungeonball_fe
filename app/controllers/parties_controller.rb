class PartiesController < ApplicationController

  def show
    party_info = PartyFacade.find_party_by_id(params[:id])
    @party = party_info[0]
    @players = party_info[1]
  end
end
