class PlayerService
  def self.conn
    Faraday.new(url: ENV['BASE_URL'], headers: { 'be_auth_key' => ENV["BE_AUTH_KEY"] }) do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_all_players_by_name(name)
    response = conn.get("/api/v1/players") do |r|
      r.params[:name] = name
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_player_by_id(id)
    response = conn.get("/api/v1/players/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
