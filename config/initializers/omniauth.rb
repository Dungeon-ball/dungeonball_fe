# OmniAuth.config.allowed_request_methods = [:post, :get]
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_api_key'], ENV['twitter_api_secret']
end
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
{
  provider: 'twitter',
  uid: '12345',
  credentials: {
    token: 'pizzaparty',
    secret: 'secretpizzaparty'
  },
  extra: {
    access_token: {
      params: {
        user_id: '123456789',
        screen_name: 'DoodlesMcGaha'
      }
    }
  }
})
