require 'rails_helper'

RSpec.describe PlayerFacade do
  describe 'search players by name' do
    it 'returns an array of player objects' do
      json_response = File.read('spec/fixtures/players_index.json')
      stub_request(:get, "http://localhost:3000/api/v1/players?name=timmy").to_return(status: 200, body: json_response)
      results = PlayerFacade.search_players_by_name("timmy")

      expect(results).to be_an(Array)
      expect(results[0]).to be_an_instance_of(Player)
    end
    it 'has the search in the name of all results' do
      json_response = File.read('spec/fixtures/players_index.json')
      stub_request(:get, "http://localhost:3000/api/v1/players?name=timmy").to_return(status: 200, body: json_response)
      results = PlayerFacade.search_players_by_name("timmy")

      expect(results[0].name.downcase).to include("timmy")
      expect(results[1].name.downcase).to include("timmy")
      expect(results[2].name.downcase).to include("timmy")
    end
  end
  describe 'find player by id' do
    it 'find player by id' do
      json_response = File.read('spec/fixtures/players_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)

      player = PlayerFacade.find_player_by_id(1)

      expect(player).to be_an_instance_of(Player)
    end
  end
end
