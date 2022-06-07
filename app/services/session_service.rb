class SessionService < FaradayService

  def self.find_or_create_user(user)
    get_url("/auth/twitter", user).post
  end
end
