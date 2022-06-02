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

end
