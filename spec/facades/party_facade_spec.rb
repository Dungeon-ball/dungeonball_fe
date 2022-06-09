require 'rails_helper'

RSpec.describe PartyFacade do
  describe 'get_party_by_id' do
    it 'returns a party object' do
      json_response = File.read("spec/fixtures/parties_show.json")
      stub_request(:get, "http://localhost:3000/api/v1/party").to_return(status: 200, body: json_response)
      party = PartyFacade.find_party_by_id("1")

      expect(party[0]).to be_an_instance_of(Party)
    end
  end

  describe 'player in party?' do
    it 'checks if a player is in a party and returns true if they are' do
      json_response = File.read("spec/fixtures/parties_show.json")
      json_response_2 = File.read("spec/fixtures/gerald.json")
      stub_request(:get, "http://localhost:3000/api/v1/party").to_return(status: 200, body: json_response)
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response_2)
      result = PartyFacade.player_in_party?(12345,1)

      expect(result).to eq(true)
    end
    it 'checks if a player is in a party and returns false if they are not' do
      json_response = File.read("spec/fixtures/parties_show.json")
      json_response_2 = File.read("spec/fixtures/player_2.json")
      stub_request(:get, "http://localhost:3000/api/v1/party").to_return(status: 200, body: json_response)
      stub_request(:get, "http://localhost:3000/api/v1/players/4").to_return(status: 200, body: json_response_2)
      result = PartyFacade.player_in_party?(12345,4)

      expect(result).to eq(false)
    end
  end
end
