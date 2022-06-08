require 'rails_helper'

RSpec.describe 'logging in with Twitter' do
  before do
    OmniAuth.config.test_mode = true
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end
  it 'has a link to login with Twitter and redirects to the root path' do

    visit root_path
    click_on 'Sign in with Twitter'


    expect(current_path).to eq(root_path)
    expect(page).to_not have_link('Sign in with Twitter')
    expect(page).to have_content('Hello, DoodlesMcGaha')
    expect(page).to have_link('Logout')
    expect(page).to have_link('My Party')
  end
end
