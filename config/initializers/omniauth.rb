# OmniAuth.config.allowed_request_methods = [:post, :get]
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_api_key'], ENV['twitter_api_secret']
end
