require 'rails_helper'

RSpec.describe 'party show page' do

  context 'as a logged in user' do
    it 'shows the a list of players names who are in the party' do
      json_response = File.read('spec/fixtures/parties_show.json')

      stub_request(:get, "http://localhost:3000/api/v1/parties?query=16").to_return(status: 200, body: json_response)
      visit '/parties/show/16'

      expect(page).to have_content("Drew")
      expect(page).to have_content("Alex")
    end
  end
end
