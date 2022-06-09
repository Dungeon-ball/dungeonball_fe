class PlayerFacade
  def self.search_players_by_name(name)
    PlayerService.get_all_players_by_name(name)[:data].map do |player_data|
      Player.new(player_data)
      # require 'pry'; binding.pry
    end
  end

  def self.find_player_by_id(id)
      data = PlayerService.get_player_by_id(id)[:data]
      Player.new(data)
  end
end
