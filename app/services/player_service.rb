class PlayerService
  def self.conn
    Faraday.new(url: ENV['BASE_URL'], headers: { 'be_auth_key' => ENV["BE_AUTH_KEY"] }) do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_all_players_by_name(name)
    response = conn.get("/api/v1/players") do |r|
      r.params[:query] = name
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_player_by_id(id)
    response = conn.get("/api/v1/players/#{id}")
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  # def self.get_all_players_by_name(name)
  #   response = conn.get("/api/v1/players/#{name}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  # def self.get_all_players_by_name(name)
  #   # require 'pry'; binding.pry
  #   get_url("/api/v1/players", name)
  # end
  #
  # def self.get_player_by_id(id)
  #   # require 'pry'; binding.pry
  #   get_url("/api/v1/players/#{id}")
  # end
end
