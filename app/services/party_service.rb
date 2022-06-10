class PartyService
  def self.conn
    Faraday.new(url: ENV['BASE_URL'], headers: { 'be_auth_key' => ENV["BE_AUTH_KEY"] }) do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_party_by_id(user_id)
    response = conn.get("/api/v1/party") do |r|
      r.params[:user_id] = user_id
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_player_party(user_id, player_id)
    response = conn.post("/api/v1/party/players") do |c|
      c.params[:user_id] = user_id
      c.params[:player_id] = player_id
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
