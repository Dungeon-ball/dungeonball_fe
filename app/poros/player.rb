class Player

  attr_reader :id, :agility, :dexterity, :strength, :charisma, :intelegence, :wisdom

  def initialize(data)
    # require 'pry'; binding.pry
    @id = data[:id]
    @name = data[:attributes][:name]
    @agility = data[:attributes][:agility]
    @dexterity = data[:attributes][:dexterity]
    @strength = data[:attributes][:strength]
    @charisma = data[:attributes][:charisma]
    @intelegence = data[:attributes][:intelegence]
    @wisdom = data[:attributes][:wisdom]
  end
end
