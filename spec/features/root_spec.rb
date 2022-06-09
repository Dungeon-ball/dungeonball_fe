require 'rails_helper'

RSpec.describe 'the root landing page' do

  context 'as a non-logged in user' do
    it 'displays the title of the app' do

      visit root_path

      expect(page).to have_content("Dungeonball")
    end

    it 'displays the search bar' do
      visit root_path

      within "#search_bar" do
        expect(page).to have_field("search_by_name")
      end
    end

    it 'has a link to sign in with Twitter' do
      visit root_path

      expect(page).to have_link("Sign in with Twitter")
    end
  end

  it 'user submits valid player name to search bar' do
    json_response = File.read('spec/fixtures/players_index.json')
    stub_request(:get, "http://localhost:3000/api/v1/players?query=timmy").to_return(status: 200, body: json_response)
    visit root_path

      fill_in 'search_by_name', with: 'timmy'
      click_button 'Search'

      expect(page).to have_content("Timmy Thompson")
      expect(page).to have_content("Thompson Stimmy")
      expect(page).to have_content("Alex Pstimmy")
  end
end
