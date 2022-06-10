require 'rails_helper'

RSpec.describe 'party show page' do


  context 'as a logged in user' do
    before :each do
      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      visit root_path
      click_on 'Sign in with Twitter'
    end

    it 'shows a list of players names who are in the party' do
      json_response = File.read('spec/fixtures/parties_show.json')

      stub_request(:get, "http://localhost:3000/api/v1/party?user_id=1").to_return(status: 200, body: json_response)
      visit '/party'

      expect(page).to have_link("Gerald")
      expect(page).to have_link("Alex")
    end

    it 'players names link to their show pages' do
      party_json_response = File.read('spec/fixtures/parties_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/party?user_id=1").to_return(status: 200, body: party_json_response)

      visit '/party'

      player_json_response = File.read('spec/fixtures/players_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: player_json_response)
      click_on "Gerald"

      expect(current_path).to eq("/players/1")
      expect(page).to have_content("Party Member")
    end
  end
end
