require 'rails_helper'

RSpec.describe Party do
  let(:drews_party) do
    Party.new({
      id: "4",
      attributes:{
      name: "Drews Party",
      user_id: "123"}

})

  end
  it 'has attributes' do
    expect(drews_party).to be_an_instance_of(Party)
    expect(drews_party.id).to eq("4")
    expect(drews_party.name).to eq("Drews Party")
    expect(drews_party.user_id).to eq("123")
  end
end
