class Party

  attr_reader :id, :name, :user_id
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @user_id = data[:attributes][:user_id]
  end
end
