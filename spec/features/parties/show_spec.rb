require 'rails_helper'

RSpec.describe 'party show page' do

  before :each do
    OmniAuth.config.mock_auth[:twitter] = nil
  end
  context 'as a logged in user' do
    it 'shows the a list of players names who are in the party' do
      json_response = File.read('spec/fixtures/parties_show.json')

      stub_request(:get, "http://localhost:3000/api/v1/party?query=16").to_return(status: 200, body: json_response)

      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      visit '/'
      click_link("Sign in with Twitter")
      visit '/parties/16'

      expect(page).to have_content("Drew")
      expect(page).to have_content("Alex")
    end

    it 'players names link to their show pages' do
      json_response = File.read('spec/fixtures/parties_show.json')
      json_response2 = File.read('spec/fixtures/players_show_2.json')



      stub_request(:get, "http://localhost:3000/api/v1/party?query=8").to_return(status: 200, body: json_response)
      stub_request(:get, "http://localhost:3000/api/v1/players/2").to_return(status: 200, body: json_response2)


      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      visit '/'
      click_link("Sign in with Twitter")
      visit '/parties/8'
      click_on "Alex"

      expect(current_path).to eq("/players/2")
    end
  end


end
