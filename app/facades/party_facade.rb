class PartyFacade
  def self.search_party_by(id)
    PlayerService.get_party_by_id(name)[:data].map do |party_data|
      Party.new(party_data)
    end
  end
end
