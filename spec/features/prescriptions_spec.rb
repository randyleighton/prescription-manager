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
  it "creates a new prescription if all information is entered correctly" do
    user = User.create(name: 'nacho', password: 'testpassword')
    drug = Drug.create(name: 'Norco', description: 'Strong Stuff', cost_not_in_dh: 10, cost_in_dh: 10, bill_to_dh: 10)
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/prescriptions'
    click_on 'New Prescription'
    select 'Norco', :from => 'prescription_drug_id'
    find_field('Drug uom')
    fill_in 'Drug uom', with: '1'
    find_field('Renewal interval')
    fill_in 'Renewal interval', with: '1'
    click_button 'Create Prescription'
    expect(page).to have_content 'Norco prescription created successfully.'
  end
  it "will not create a new prescription unless all information is entered correctly" do
    user = User.create(name: 'nacho', password: 'testpassword')
    drug = Drug.create(name: 'Norco', description: 'Strong Stuff', cost_not_in_dh: 10, cost_in_dh: 10, bill_to_dh: 10)
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/prescriptions'
    click_on 'New Prescription'
    select 'Norco', :from => 'prescription_drug_id'
    find_field('Drug uom')
    fill_in 'Drug uom', with: '1'
    click_button 'Create Prescription'
    expect(page).to have_content "Renewal interval can't be blank"
  end
end

describe "individual prescriptions" do
  it "views the information for an individual prescription when a user clicks on it" do
    user = User.create(name: 'nacho', password: 'testpassword')
    drug = Drug.create(name: 'Norco', description: 'Strong Stuff', cost_not_in_dh: 10, cost_in_dh: 10, bill_to_dh: 10)
    prescrip = Prescription.create(drug_id: drug.id, user_id: user.id, drug_uom: 1, renewal_interval: 1)
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/prescriptions'
    click_link 'Norco'
    expect(page).to have_content 'Delete this prescription'
  end
  it "deletes an individual prescription when a user clicks on delete link" do
    user = User.create(name: 'nacho', password: 'testpassword')
    drug = Drug.create(name: 'Norco', description: 'Strong Stuff', cost_not_in_dh: 10, cost_in_dh: 10, bill_to_dh: 10)
    prescrip = Prescription.create(drug_id: drug.id, user_id: user.id, drug_uom: 1, renewal_interval: 1)
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/prescriptions'
    click_link 'Norco'
    click_link 'Delete this prescription'
    expect(page).to have_content 'Successful'
  end







end
