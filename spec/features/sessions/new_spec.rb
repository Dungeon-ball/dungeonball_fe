require 'rails_helper'

RSpec.describe 'logging in with Twitter' do
  before do
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end
  it 'has a link to login with Twitter and redirects to the root path' do
    # json_response = File.read('spec/fixtures/user.json')
    # # stub_request(:post, "http://127.0.0.1:3000/auth/twitter").to_return(status: 200, body: json_response)
    # stub_request(:get, "http://127.0.0.1:3000/auth/twitter/callback").to_return(status: 200, body: json_response)
    # # require 'pry'; binding.pry
    # # allow(User).to receive(:from_omniauth).and_return(json_response)
    # allow(SessionService).to receive(:find_or_create_user).and_return(json_response)
    visit root_path

    click_on 'Sign in with Twitter'
    save_and_open_page
    fill_in 'session[username_or_email]', with: 'smoothestc@gmail.com'
    fill_in 'password', with: 'Alexis@dumbguy123'
    click_on 'Sign In'
    # Things needed to make a User: uid, extra.access_token.params[:screen_name], extra.access_token.token, extra.access_token.secret


    expect(current_path).to eq(root_path)
    expect(page).to_not have_link('Sign in with Twitter')
    expect(page).to have_content('Hello,')
    expect(page).to have_link('Logout')
  end
end
