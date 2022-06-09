require 'rails_helper'

RSpec.describe PartyService do
  it '#get_party_by_id' do
    json_response = File.read("spec/fixtures/parties_show.json")
    stub_request(:get, "http://localhost:3000/api/v1/party?query=1").to_return(status: 200, body: json_response)
    party = PartyService.get_party_by_id("1")

    expect(party).to be_a(Hash)
    expect(party[:data][:type]).to eq("party")
    expect(party[:data][:attributes][:relationships][:players][:data].length).to eq(2)
    expect(party[:data][:attributes][:relationships][:players][:data][0][:name]).to eq("Drew")
  end
  it '#update_player_party' do
    json_response = File.read("spec/fixtures/add_player_after.json")
    stub_request(:post, "http://localhost:3000/api/v1/parties/12345/players?query=1").to_return(status: 200, body: json_response)
    updated_party = PartyService.update_player_party(12345,1)


    expect(updated_party).to be_a(Hash)
    expect(updated_party[:data][:type]).to eq("party")
    expect(updated_party[:data][:attributes][:relationships][:players][:data].length).to eq(1)
    expect(updated_party[:data][:attributes][:relationships][:players][:data][0][:name]).to eq("Gerald")
  end
end
