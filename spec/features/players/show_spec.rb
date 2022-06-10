require 'rails_helper'

RSpec.describe 'player show page' do

  context 'shows all player attributes' do
    it 'shows all the attributes of a specific player' do
      json_response = File.read('spec/fixtures/player_89.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/89").to_return(status: 200, body: json_response)
      visit '/players/89'

      expect(page).to have_content("Bryan Bulaga")
      expect(page).to have_content("Strength: 18")
      expect(page).to have_content("Dexterity: 14")
      expect(page).to have_content("Constitution: 18")
      expect(page).to have_content("Intelligence: 19")
      expect(page).to have_content("Wisdom: 10")
      expect(page).to have_content("Charisma: 8")
      expect(page).to have_content("Class: Fighter")
    end
  end

  context 'as a non-logged-in user' do
    it 'I do not see a link to Add Player to My Party' do
      json_response = File.read('spec/fixtures/players_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response)
      visit '/players/1'

      expect(page).to_not have_link("Add Player to My Party")
    end
  end

  context 'as a logged-in user' do
    before do
      # OmniAuth.config.mock_auth[:twitter] = nil
      OmniAuth.config.test_mode = true
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      visit root_path
      click_on 'Sign in with Twitter'
      # The user then sees a link to 'My Party', clicks on it and is redirected to the Party Index page, where each player in the party is a link to that player's show page. The user then clicks the name of 'Gerald' and is redirected to that player's show page.
    end

    it 'I do not see a button to add player if player is already in party' do
      players_json_response = File.read('spec/fixtures/players_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: players_json_response)
      party_json_response = File.read('spec/fixtures/parties_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/party?user_id=1").to_return(status: 200, body: party_json_response)
      visit '/players/1'

      expect(page).to_not have_button('Add Player to My Party')
    end

    it 'I see a button to add the player if not already in my party' do
      players_json_response = File.read('spec/fixtures/players_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: players_json_response)
      party_json_response = File.read('spec/fixtures/empty_parties_show.json')
      stub_request(:get, "http://localhost:3000/api/v1/party?user_id=1").to_return(status: 200, body: party_json_response)
      visit '/players/1'

      expect(page).to have_button('Add Player to My Party')
    end
  end
end
