require 'rails_helper'

RSpec.describe PlayerService do
  it '#get_all_players_by_name' do
    json_response = File.read("spec/fixtures/players_index.json")
    stub_request(:get, "http://localhost:3000/api/v1/players?query=timmy").to_return(status: 200, body: json_response)
    get_players = PlayerService.get_all_players_by_name("timmy")

    expect(get_players).to be_a(Hash)
    expect(get_players[:data]).to be_a(Array)
    expect(get_players[:data].count).to eq(3)
    expect(get_players[:data][0][:attributes][:name]).to eq("Timmy Thompson")
    expect(get_players[:data][1][:attributes][:name]).to eq("Thompson Stimmy")
    expect(get_players[:data][2][:attributes][:name]).to eq("Alex Pstimmy")
  end

  it '#get_player_by_id'  do
    json_response = File.read("spec/fixtures/players_show.json")
    stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)
    player = PlayerService.get_player_by_id("1")

    expect(player).to be_a(Hash)
    expect(player[:data][:type]).to eq("player")
    expect(player[:data][:attributes].length).to eq(8)
    expect(player[:data][:attributes][:dexterity]).to eq(14)
  end
end
