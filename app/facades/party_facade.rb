class PartyFacade
  def self.find_party_by_id(id)

    raw_data = PartyService.get_party_by_id(id)
    party= raw_data.map do |party_data|
      Party.new(party_data)
    end

    players = party_data[:data][:attributes][:relationships][:players][:data]
    players.map do |player_data|
      PlayerIndex.new(player_data)
    end
    [party_info,players]
  end
end
