class PartyFacade
  def self.find_party_by_id(id)

    raw_data = PartyService.get_party_by_id(id)

    party = Party.new(raw_data[:data])

    players = raw_data[:data][:attributes][:relationships][:players][:data]
    players.map do |player_data|
      PlayerIndex.new(player_data)
    end
    [party,players]
  end
end
