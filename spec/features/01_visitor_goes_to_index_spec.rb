require 'rails_helper'

# [] Visiting the `/theaters` path should contain a list of theaters.

feature "visitor sees a list of theaters" do
  scenario "sees a list of theaters and link for new theater" do
    user = FactoryGirl.create(:user, role: 'member')
    amc = Theater.create(name: 'AMC', address: '33 Harrison Ave', city: 'Phildelphia', state: 'PA', zip: '19177', user: user)
    regal = Theater.create(name: "Regal Cinemas", address: "Beach streer", city: "Phildelphia", state: "PA", zip: "19701", user: user)

    visit theaters_path

    expect(page).to have_content "AMC"
    expect(page).to have_link "Regal Cinemas"
  end

  scenario "clicks link and is taken to show page for given theater" do
    user = FactoryGirl.create(:user, role: 'member')
    amc = Theater.create(name: 'AMC', address: '33 Harrison Ave', city: 'Phildelphia', state: 'PA', zip: '19177', user: user)

    visit theaters_path

    click_link "AMC"

    expect(page).to have_content amc.name
    expect(page).to have_content amc.address
    expect(page).to have_content amc.city
    expect(page).to have_content amc.state
    expect(page).to have_content amc.zip
  end

end