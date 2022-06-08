require 'rails_helper'

RSpec.describe 'player show page' do


    it 'shows the a list of players names who are in the party' do
      json_response = File.read('spec/fixtures/players_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)
      visit '/players/1'
      # parsed = JSON.parse(response.body, symbolize_names: true)
      # player = parsed[:data]
      # expect(response.status).to eq(200)


      expect(page).to have_content("Gerald")
      expect(page).to have_content("Strength: 15")
      expect(page).to have_content("Dexterity: 14")
      expect(page).to have_content("Constitution: 13")
      expect(page).to have_content("Intelligence: 8")
      expect(page).to have_content("Wisdom: 15")
      expect(page).to have_content("Charisma: 12")
      expect(page).to have_content("Class: wizard")
    end

    it 'has a link to login with twitter if not already logged in' do
      json_response = File.read('spec/fixtures/players_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)

      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      visit '/players/1'

      expect(page).to have_content("Sign in with Twitter to add this player to your party")

      click_link("Sign in with Twitter to add this player to your party")

      expect(page).to have_content("DoodlesMcGaha")
    end

    it 'has a button to add player to party if logged in  ' do
      json_response = File.read('spec/fixtures/players_show.json')
      json_response2 = File.read('spec/fixtures/empty_party.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)
      stub_request(:get, "http://localhost:3000/api/v1/parties?query=12345").to_return(status: 200, body: json_response2)

      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      visit '/'
      click_link("Sign in with Twitter")
      visit '/players/1'
      expect(page).to have_button("Add Player to My Party")
    end

    it 'has a button to add player to party that adds player to a party  ' do
      json_response = File.read('spec/fixtures/players_show.json')
      json_response2 = File.read('spec/fixtures/add_player_after.json')
      json_response3 = File.read('spec/fixtures/party_show_12345.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)
      stub_request(:post, "http://localhost:3000/api/v1/parties/12345/players?query=1").to_return(status: 200, body: json_response2)
      stub_request(:get, "http://localhost:3000/api/v1/parties?query=12345").to_return(status: 200, body: json_response3)

      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

      visit '/'
      click_link("Sign in with Twitter")
      visit '/players/1'
      click_button("Add Player to My Party")

      expect(page).to have_content("Awesome party")
      expect(page).to have_content("Drew")
    end

    it 'does not show add player if the player is already in the party' do
      json_response = File.read('spec/fixtures/players_show.json')
      json_response2 = File.read('spec/fixtures/parties_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)
      stub_request(:get, "http://localhost:3000/api/v1/parties?query=12345").to_return(status: 200, body: json_response2)

      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

      visit '/'
      click_link("Sign in with Twitter")
      visit '/players/1'
      expect(page).to have_content("Party Member")
      expect(page).to_not have_content("Add Player to My Party")
    end
  end
