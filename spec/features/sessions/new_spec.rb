require 'rails_helper'

RSpec.describe 'logging in with Twitter' do
  before :each do
    OmniAuth.config.test_mode = true
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end
  it 'has a link to login with Twitter and redirects to the root path where I see a link to my party' do

    visit root_path

    click_on 'Sign in with Twitter'

    expect(current_path).to eq(root_path)
    expect(page).to_not have_link('Sign in with Twitter')
    expect(page).to have_content('Hello, DoodlesMcGaha')
    expect(page).to have_link('Logout')
    expect(page).to have_link('My Party')
  end

  it 'the my party link redirects me to my party show page' do
    json_response = File.read('spec/fixtures/parties_show.json')
    stub_request(:get, "http://localhost:3000/api/v1/party?user_id=1").to_return(status: 200, body: json_response)

    visit root_path
    click_on 'Sign in with Twitter'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('My Party')

    click_link('My Party')
    expect(current_path).to eq('/party')
  end
end
