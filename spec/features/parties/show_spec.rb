require 'rails_helper'

RSpec.describe 'party show page' do

  context 'as a logged in user' do
    it 'shows the a list of players names who are in the party' do
      json_response = File.read('spec/fixtures/parties_show.json')

      stub_request(:get, "http://localhost:3000/api/v1/parties?query=16").to_return(status: 200, body: json_response)

      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      visit '/'
      click_link("Sign in with Twitter")
      visit '/parties/show/16'

      expect(page).to have_content("Drew")
      expect(page).to have_content("Alex")
    end

    it 'players names link to their show pages' do
      json_response = File.read('spec/fixtures/parties_show.json')

      stub_request(:get, "http://localhost:3000/api/v1/parties?query=16").to_return(status: 200, body: json_response)
      visit '/parties/show/16'

      click_on "Alex"

      expect(current_path).to eq(search_players_path)
    end
  end


end
