require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "can save if has name and style" do

    style = FactoryGirl.create :style
    beer = Beer.create name:"Testi", style_id:style.id

    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "cannot save without name" do
    style = FactoryGirl.create :style
    beer = Beer.create style_id:style.name

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "cannot save without style" do
    beer = Beer.create name:"Testi"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end
