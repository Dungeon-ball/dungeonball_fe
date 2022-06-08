class PartyService < FaradayService
  # def self.conn
  #   Faraday.new(url: "http://localhost:3000") do |f|
  #     f.adapter Faraday.default_adapter
  #   end
  # end

  # def self.get_all_players_by_name(name)
  #   response = conn.get("/api/v1/players/#{name}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.get_party_by_id(id)
    # require 'pry'; binding.pry
    get_url("/api/v1/parties", id)
  end

  def self.add_player_to_party(user_id, player_id)
    get_url("/api/v1/parties/players",user_id, player_id )
    redirect_to "pla"
  end
end
