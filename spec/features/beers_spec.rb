require 'rails_helper'

include Helpers

describe "Beer" do
  before :each do
    FactoryGirl.create :brewery
    FactoryGirl.create :user
    FactoryGirl.create :style
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can add new if name is added" do
    visit new_beer_path
    fill_in('beer_name', with:'Tuoppi')
    select('Lager', from:'beer[style_id]')
    select('anonymous', from:'beer[brewery_id]')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)
  end

  it "cannot add new if name not added" do
    visit new_beer_path
    select('Lager', from:'beer[style_id]')
    select('anonymous', from:'beer[brewery_id]')

    click_button('Create Beer')
    expect(Beer.count).to eq(0)
    expect(page).to have_content "Name can't be blank"
  end
end