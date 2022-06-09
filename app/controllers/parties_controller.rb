class PartiesController < ApplicationController

  before_action :current_user, only: [:show]

  def show
    party_info = PartyFacade.find_party_by_id(current_user.id)
    @party = party_info[0]
    @players = party_info[1]
  end

  def update

  end



end
