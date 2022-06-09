require 'rails_helper'

RSpec.describe Player do
  let(:drew) do
    Player.new({
      id: "4",
      attributes:{
        name: "Drew",
        dexterity: "15",
        strength: "15",
        constitution: "8",
        charisma: "8",
        intelligence: "10",
        wisdom: "16",
          class:{
            name:"Wizard"
                }
      }})

  end
  it 'has attributes' do
    expect(drew).to be_an_instance_of(Player)
    expect(drew.id).to eq("4")
    expect(drew.name).to eq("Drew")
    expect(drew.dexterity).to eq("15")
    expect(drew.strength).to eq("15")
    expect(drew.constitution).to eq("8")
    expect(drew.charisma).to eq("8")
    expect(drew.intelligence).to eq("10")
    expect(drew.wisdom).to eq("16")
    expect(drew.class).to eq("Wizard")
  end
end
