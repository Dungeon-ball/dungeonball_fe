class Player

  attr_reader :id, :agility, :dexterity, :strength, :charisma, :intelligence, :wisdom, :class

  def initialize(data)

    @id = data[:id]
    @name = data[:attributes][:name]
    @agility = data[:attributes][:agility]
    @dexterity = data[:attributes][:dexterity]
    @strength = data[:attributes][:strength]
    @charisma = data[:attributes][:charisma]
    @intelligence = data[:attributes][:intelligence]
    @wisdom = data[:attributes][:wisdom]
    @class = data[:attributes][:class]
  end
end
