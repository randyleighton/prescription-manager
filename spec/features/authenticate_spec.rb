require 'rails_helper'

describe "user sign in" do

  it "will successfully allow a user to sign up" do
    visit '/signup'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    fill_in 'Password confirmation', with: 'testpassword'
    click_button 'Create User'
    expect(page).to have_content 'Logged in as nacho'
  end

  it "will not allow a user to sign up without all information" do
    visit '/signup'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    fill_in 'Password confirmation', with: 'nopassword'
    click_button 'Create User'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end



  it "will take an existing user to the log in page" do
    visit '/'
    click_link 'Log In'
    expect(page).to have_content 'Log In'
  end


  it "will login a user who enters credentials successfully" do
    user = User.create(name: 'nacho', password: 'testpassword')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    expect(page).to have_content 'Logged in as nacho'
  end

  it "will not login a user who does not enter credentials successfully" do
    user = User.create(name: 'nacho', password: 'testpassword')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'wrong password'
    click_button 'Log In'
    expect(page).to have_content 'Name or Password is Invalid'
  end



  it "will successfully log out a user" do
    user1 = User.create(name: 'nacho', password: 'testpassword')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    click_link 'Log Out'
    expect(page).to have_content 'Logged out'
  end

end
