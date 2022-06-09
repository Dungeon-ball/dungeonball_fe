require 'rails_helper'

RSpec.describe 'the search index page' do

  context 'as a non-logged in user' do
    it 'shows the search results of players whose name contains the search fragment' do
      json_response = File.read('spec/fixtures/players_index.json')
      stub_request(:get, "http://localhost:3000/api/v1/players?query=timmy").to_return(status: 200, body: json_response)
      visit root_path
      fill_in "search_by_name", with: "timmy"
      click_on "Search"

      expect(current_path).to eq (search_players_path)
      expect(page).to have_content("Timmy Thompson")
      expect(page).to have_content("Thompson Stimmy")
      expect(page).to have_content("Alex Pstimmy")
    end

    it 'each name is a link to that players show page' do
      json_response = File.read('spec/fixtures/players_index.json')
      stub_request(:get, "http://localhost:3000/api/v1/players?query=timmy").to_return(status: 200, body: json_response)
      json_response_2 = File.read('spec/fixtures/players_show_2.json')
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response_2)

      visit root_path
      fill_in "search_by_name", with: "timmy"
      click_on "Search"

      expect(current_path).to eq (search_players_path)
      expect(page).to have_link("Timmy Thompson")
      click_link("Timmy Thompson")
      stub_request(:get, "http://localhost:3000/api/v1/players/1").to_return(status: 200, body: json_response_2)

      expect(current_path).to eq("/players/1")
      expect(page).to have_content("Timmy Thompson")
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
