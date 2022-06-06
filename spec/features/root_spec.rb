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

    it 'has a button to login' do
      visit root_path

      within "#login" do
        expect(page).to have_button("Login")
      end
    end

    it 'has a button to create a new account' do
      visit root_path

      expect(page).to have_button("Create A New Account")
    end
  end

  it 'user submits valid player name to search bar' do
    json_response = File.read('spec/fixtures/players_index.json')
    stub_request(:get, "http://localhost:3000/api/v1/players?query=timmy").to_return(status: 200, body: json_response)
    visit root_path

      fill_in 'search_by_name', with: 'timmy'
      click_button 'Search'

      # require 'pry'; binding.pry
      # parsed = JSON.parse(response.body, symbolize_names: true)
      # players = parsed[:data]
      # expect(response.status).to eq(200)
      # expect(players.class).to eq(Array)
      # players.each do |player|
      # expect(player).to have_key([:attributes])
      # expect(player[:attributes][:name]).to be_a String
      # expect(player[:attributes][:strength]).to be_a Integer
      # expect(player[:attributes][:class]).to be_a Hash
      expect(page).to have_content("Timmy Thompson")
      expect(page).to have_content("Thompson Stimmy")
      expect(page).to have_content("Alex Pstimmy")

  end

end
