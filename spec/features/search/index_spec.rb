require 'rails_helper'

RSpec.describe 'the search index page' do

  context 'as a non-logged in user' do
    it 'shows the search results of players whose name contains the search fragment' do
      json_response = File.read('spec/fixtures/players_index.json')
      stub_request(:get, "http://localhost:3000/api/v1/players?query=timmy").to_return(status: 200, body: json_response)
      visit root_path
      fill_in "search_by_name", with: "timmy"
      click_on "Search"

      expect(page).to have_content("Timmy Thompson")
      expect(page).to have_content("Thompson Stimmy")
    end
  end

end
