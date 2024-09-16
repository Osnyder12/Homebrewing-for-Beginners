require 'rails_helper'

feature "User can see two tiles for starter recipes and brewdog recipes" do
  let!(:user) { FactoryBot.create(:user) }

  scenario "User visits index page" do
    visit '/'
    expect(page).to have_content("Choose from our starter recipes!")
    expect(page).to have_content("BrewDog Brewery Recipes!")
  end

  scenario "User clicks a link to visit a starter recipe index page" do
    visit '/'
    find("a[href='#{beers_path}']").click

    expect(page).to have_current_path("/beers")
  end

  scenario "User clocls a link to visit a brewdog recipe index page" do
    visit '/'
    find("a[href='#{external_beers_path}']").click

    expect(page).to have_current_path("/external_beers")
  end
end