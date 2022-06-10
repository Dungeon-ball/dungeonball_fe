class PartiesController < ApplicationController

  before_action :current_user, only: [:show]

  def show
    if current_user
      party_info = PartyFacade.find_party_by_id(current_user.id)
      @party = party_info[0]
      @players = party_info[1]
    else
      flash[:notice] = 'you need to log in to view this page.'
      redirect_to root_path
    end
  end

  def update
    PartyService.update_player_party(current_user.id, params[:player_id])
    redirect_to '/party'
  end
end
