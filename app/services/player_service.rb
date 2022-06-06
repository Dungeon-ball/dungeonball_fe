class PlayerService < FaradayService
  # def self.conn
  #   Faraday.new(url: "http://localhost:3000") do |f|
  #     f.adapter Faraday.default_adapter
  #   end
  # end

  # def self.get_all_players_by_name(name)
  #   response = conn.get("/api/v1/players/#{name}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.get_all_players_by_name(name)
    require 'pry'; binding.pry
    get_url("/api/v1/players", name)
  end
end
