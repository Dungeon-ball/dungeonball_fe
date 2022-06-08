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

  def self.get_party_by_id(user_id)
    # require 'pry'; binding.pry
    get_url("/api/v1/party", user_id)
  end

  def self.update_player_party(user_id, player_id)

    post_url("/api/v1/parties/#{user_id}/players", player_id )
  end
end
