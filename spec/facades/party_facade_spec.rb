require 'rails_helper'

RSpec.describe PartyFacade do
  describe 'get_party_by_id' do
    it 'returns a party object' do
      json_response = File.read("spec/fixtures/parties_show.json")
      stub_request(:get, "http://localhost:3000/api/v1/party?query=1").to_return(status: 200, body: json_response)
      party = PartyFacade.find_party_by_id("1")

      expect(party).to be_an_instance_of(Party)
    end
  end

  describe 'add player to party' do
    it 'adds a player to a party' do
      json_response = File.read("spec/fixtures/add_player_after.json")
      stub_request(:post, "http://localhost:3000/api/v1/parties/12345/players?query=1").to_return(status: 200, body: json_response)
      updated_party = PartyFacade.add_player_to_party(12345,1)



      expect(updated_party).to be_an_instance_of(Party)
    end
  end
end
