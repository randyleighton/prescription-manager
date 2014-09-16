require 'rails_helper'

describe "drug authentication" do
  it "will not allow user to access drug page without being logged in" do
    visit '/'
    find(:xpath, "//a[contains(@href,'/drugs')]").click
    expect(page).to have_content 'Log In'
  end
  it "will allow a user to access drug page if logged in" do
    user = User.create(name: 'nacho', password: 'testpassword')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/drugs'
    expect(page).to have_content 'Current Drugs:'
  end
end

# describe "adding drugs" do
#   it "allows user to create a new drug if all information is entered" do
    # user = User.create(name: 'nacho', password: 'testpassword')
    # visit '/login'
    # fill_in 'Name', with: 'nacho'
    # fill_in 'Password', with: 'testpassword'
    # click_button 'Log In'
    # visit '/drugs'
    # find(:xpath, "//a[contains(@href,'/drugs/new')]").click
    # fill_in 'Name', with: 'Norco'
    # fill_in 'Description', with: 'Hydrocodone Generic for pain'
    # fill_in 'Cost_not_in_dh', with: '10'
    # fill_in 'Cost_in_dh', with: '30'
    # fill_in 'Bill_to_dh', with: '20'
    # click_button 'Create Drug'
    # expect(page).to have_content 'Norco created successfully'

#   end
#   it "will not allow a user to create a new drug if missing information" do

#   end
# end

# describe "individual drugs" do
#   it "views the information for a specific drug when a user clicks on it" do

#   end
#   it "deletes a drug when a user chooses to destroy it" do

#   end
# end
