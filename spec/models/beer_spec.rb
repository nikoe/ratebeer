require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "can save if has name and style" do
    beer = Beer.create name:"Testi", style:"IPA"

    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "cannot save without name" do
    beer = Beer.create style:"IPA"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "cannot save without style" do
    beer = Beer.create name:"Testi"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end
