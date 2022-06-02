class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties

  # validates_presence_of :name, :email, :password_digest
  # has_secure_password
  #Oauth is supposed to be taking care of this?
  #
end
