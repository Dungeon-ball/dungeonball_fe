require 'rails_helper'

RSpec.describe 'logging out with Twitter' do
  it 'logs out of twitter' do
    OmniAuth.config.test_mode = true
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    visit root_path

    click_on 'Sign in with Twitter'
    click_link('Logout')

    expect(page).to have_content("Sign in with Twitter")
  end
end
