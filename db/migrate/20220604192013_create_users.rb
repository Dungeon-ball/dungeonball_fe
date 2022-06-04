class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :uid
      t.string :oath_token
      t.string :oauth_token_secret

      t.timestamps
    end
  end
end
