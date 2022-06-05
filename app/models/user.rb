class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.screen_name        = auth_info.extra.access_token.params[:screen_name]
      new_user.oauth_token        = auth_info.extra.access_token.token
      new_user.oauth_token_secret = auth_info.extra.access_token.secret
      # new_user.oauth_token        = auth_info.extra.access_token.params[:oauth_token]
      # new_user.oauth_token_secret = auth_info.info.access_token.params[:oauth_token_secret]
    end
  end
end
