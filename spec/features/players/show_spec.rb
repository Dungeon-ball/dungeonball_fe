require 'rails_helper'

RSpec.describe 'player show page' do

  context 'shows all player attributes' do
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
  end
end
