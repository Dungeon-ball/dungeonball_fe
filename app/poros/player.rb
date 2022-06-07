class Player

  attr_reader :id, :constitution, :dexterity, :strength, :charisma, :intelligence, :wisdom, :class, :name

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @dexterity = data[:attributes][:dexterity]
    @strength = data[:attributes][:strength]
    @constitution = data[:attributes][:constitution]
    @charisma = data[:attributes][:charisma]
    @intelligence = data[:attributes][:intelligence]
    @wisdom = data[:attributes][:wisdom]
    @class = data[:attributes][:class][:name]
  end
end
