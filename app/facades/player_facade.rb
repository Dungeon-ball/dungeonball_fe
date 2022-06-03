class PlayerFacade
  def self.search_players_by_name(name)
    PlayerService.get_all_players_by_name(name)[:data].map do |player_data|
      Player.new(player_data)
    end
  end
end
