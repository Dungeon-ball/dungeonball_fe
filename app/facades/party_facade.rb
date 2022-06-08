class PartyFacade
  def self.find_party_by_id(user_id)

    raw_data = PartyService.get_party_by_id(user_id)
    party = Party.new(raw_data[:data])

    players = raw_data[:data][:attributes][:relationships][:players][:data]
    players.map do |player_data|
      PlayerIndex.new(player_data)
    end
    [party,players]
  end

  def self.add_player_to_party(user_id, player_id)
    PartyService.update_player_party(user_id, player_id)
  end

  def self.player_in_party?(user_id, player_id)
    binding.pry
    data = PartyService.get_party_by_id(user_id)
    party_ids = data[:data][:attributes][:relationships][:players][:data].map do |player|
      player[:id]
    end
    if party_ids.include?(player_id.to_i)
      return true
    else
      return false
    end
  end
end
