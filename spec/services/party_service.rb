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
end
