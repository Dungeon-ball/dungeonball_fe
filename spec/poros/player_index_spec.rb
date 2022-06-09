require 'rails_helper'

RSpec.describe PlayerIndex do
  let(:drew) do
    PlayerIndex.new({
      id: "4",
      name: "Drew"

})

  end
  it 'has attributes' do
    expect(drew).to be_an_instance_of(PlayerIndex)
    expect(drew.id).to eq("4")
    expect(drew.name).to eq("Drew")
  end
end
