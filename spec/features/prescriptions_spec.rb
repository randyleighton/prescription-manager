require 'rails_helper'

describe "prescription authentication" do
  it "will not allow user to access prescription page without being logged in" do
    visit '/'
    find('img#prescrip-main').click
    expect(page).to have_content 'Log In'
  end
  it "will allow a user to access prescription page if logged in" do
    user = User.create(name: 'nacho', password: 'testpassword')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/prescriptions'
    expect(page).to have_content 'Current Prescriptions:'
  end
  it "redirects a user to drugs page if none exist" do
    user = User.create(name: 'nacho', password: 'testpassword')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/prescriptions'
    click_on 'New Prescription'
    expect(page).to have_content 'Create drugs to use in your prescriptions'
  end

end



describe "adding prescriptions" do

end

