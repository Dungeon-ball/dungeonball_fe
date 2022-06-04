class Party

  attr_reader :id, :name, :user_id, :players
  def initialize(data)

    @id = data[:id]
    @name = data[:attributes][:name]
    @user_id = data[:attributes][:user_id]
    @players = data[:players]
  end
end
